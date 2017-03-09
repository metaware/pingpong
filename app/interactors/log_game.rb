class LogGame

  include Interactor

  after do
    UpdateRankings.call({ game_id: context.game.id })
  end

  def call
    context.game = context.user.games.build(context.game_params)
    if context.game.valid?
      context.game.save
    else
      context.fail!(error: 'Invalid Game Submission')
    end
  end

end