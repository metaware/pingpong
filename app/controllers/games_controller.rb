class GamesController < ApplicationController

  def new
    @game = Game.new
  end

  def create
    result = LogGame.call({ user: current_user, game_params: game_params})
    if result.success?
      flash[:notice] = "Game logged successfully!"
    else
      flash[:error] = result.error
      @game = result.game
    end
    redirect_to :back
  end

  protected
  def game_params
    params.require(:game).permit(:date_played, :opponent_id, :opponent_score, :player_score)
  end

end