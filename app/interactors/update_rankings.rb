class UpdateRankings

  include Interactor

  def call
    game = Game.find(context.game_id)
    # TODO - handle the tie case properly
    if !game.tie?
      game.winner.elo.wins_from(game.loser.elo)
      game.winner.update_attribute(:score, game.winner.elo.rating)
      game.loser.update_attribute(:score, game.loser.elo.rating)
    end
  end

end