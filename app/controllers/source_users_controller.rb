# xxx get rid of this
require 'twitter_service'

class SourceUsersController < ApplicationController

  def index
    # xxx change this to instance var when finished with testing
    @@users ||= TwitterService.new.get_users 3
    respond_to do |format|
      format.json { render json: @@users }
    end
  end

  # xxx refac to make restful
  def get_tweets
    tweets = TwitterService.new.get_tweets(params[:screen_name])
    respond_to do |format|
      format.json { render json: tweets }
    end
  end

  def users=(usrs)
    @@users = usrs
  end

  def users
    @@users
  end
end
