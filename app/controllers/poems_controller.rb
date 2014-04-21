class PoemsController < ApplicationController

  def index
    @poems = Poem.all(limit: 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @poems }
    end
  end

  def show
    @poem = Poem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @poem }
    end
  end

  def new
    @poem = Poem.new

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @poem }
    end
  end

  def create
    @poem = Poem.new(params[:poem])
    @poem.user = current_user

    if @poem.save && params[:share]
      # TwitterService.new.share(@poem) if params[:share]
      token = current_user.twitter_oauth_token #||= ENV['YOUR_OAUTH_TOKEN']
      secret = current_user.twitter_oauth_secret #||= ENV['YOUR_OAUTH_TOKEN_SECRET']

      client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["CONSUMER_KEY"]
        config.consumer_secret     = ENV["CONSUMER_SECRET"]
        config.access_token        = token
        config.access_token_secret = secret
      end

      tweet_text = "#gldgv "
      tweet_text << "#{poem.source_user} "
      tweet_text << "#{poem.text.truncate(90)} "
      tweet_text << "goldengrove.co/poems/#{poem.id}"
      # client.update(tweet_text)
      puts "TWEET TEXT"
      puts tweet_text
    end

    titles = Title.where(title: "Apprentice Wordsmith")

    respond_to do |format|
      format.json { render json: titles }
    end
  end

  # def update
  #   @poem = Poem.find(params[:id])

  #   respond_to do |format|
  #     if @poem.update_attributes(params[:poem])
  #       format.html { redirect_to @poem, notice: 'Poem was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @poem.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    respond_to do |format|
      format.html { redirect_to poems_url }
      format.json { head :no_content }
    end
  end

  private

  def check_for_titles(poem)
  end
end
