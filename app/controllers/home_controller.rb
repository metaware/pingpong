class HomeController < ApplicationController

  def index
    # TODO: I'd likely add pagination here instead of blindly doing a .all
    @users = User.all.includes(:games)
  end

  def history
    @games = current_user.games.includes(:player, :opponent)
  end

  def log
  end
end
