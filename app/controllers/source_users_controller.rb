class SourceUsersController < ApplicationController

  def index
    usernames = TwitterUser.sample
    users = TwitterService.new.get_users_from_usernames(usernames)
    respond_to do |format|
      format.json { render json: users }
    end
  end

end