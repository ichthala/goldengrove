require 'title_checker'

class PoemsController < ApplicationController

  def index
    # TODO: this is probably slow, preload associations?
    # TODO: DON'T INCLUDE TWITTER SECRETS IN USER JSON!!!
    page = params[:page].to_i
    page_size = 4
    @poems = Poem.order(created_at: :desc).limit(page_size).offset(page_size * page).each.as_json(include: [:user])
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
    # xxx refac
    params[:poem][:source_user] = "@#{params[:poem][:source_user]}"
    @poem = Poem.new(poem_params)
    @poem.user = current_user

    if @poem.save
      TwitterService.new.share(user: current_user, poem: @poem) if params[:share]
      # binding.pry
      titles = TitleChecker.new(user: current_user, poem: @poem).check_for_titles
      current_user.titles << titles
    end

    respond_to do |format|
      format.json { render json: titles }
    end
  end

  def destroy
    @poem = Poem.find(params[:id])
    @poem.destroy

    respond_to do |format|
      format.html { redirect_to poems_url }
      format.json { head :no_content }
    end
  end

  private

  def poem_params
    params.require(:poem).permit(:source_user, :text)
  end

end
