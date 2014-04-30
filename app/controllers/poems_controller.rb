require 'title_checker'

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

    if @poem.save
      TwitterService.new.share(user: current_user, poem: @poem) if params[:share]
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

end
