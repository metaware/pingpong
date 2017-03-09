class HomeController < ApplicationController

  def index
    # TODO: I'd likely add pagination here instead of blindly doing a .all
    @users = User.all.includes(:games).order('score DESC')
  end

  def history
    @games = current_user.games.includes(:player, :opponent).order('id DESC')
  end

  def log
  end
end
