class LogGame

  include Interactor

  after do
    UpdateRankings.call({ game_id: context.game.id })
  end

  def call
    game = context.user.games.build(context.game_params)
    if game.valid?
      game.save
      context.game = game
    else
      context.game = game
      context.fail!(error: 'Invalid Game Submission')
    end
  end

end