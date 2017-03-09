class GamesController < ApplicationController

  before_action :load_opponents, only: %w(new create)

  def new
    @game = Game.new
  end

  def create
    result = LogGame.call({ user: current_user, game_params: game_params})
    if result.success?
      flash[:notice] = "Game logged successfully!"
      redirect_to new_game_path
    else
      flash[:error] = result.error
      @game = result.game
      render 'new'
    end
  end

  protected
  def load_opponents
    @possible_opponents = User.where.not(id: current_user)
  end

  def game_params
    params.require(:game).permit(:date_played, :opponent_id, :opponent_score, :player_score)
  end

end