class HomeController < ApplicationController
  def index
  end

  def history
    @games = current_user.games
  end

  def log
  end
end
