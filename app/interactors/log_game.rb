class LogGame

  include Interactor

  def call
    game = context.user.games.build(context.game_params)
    if game.valid?
      game.save
    else
      context.game = game
      context.fail!(error: 'Invalid Game Submission')
    end
  end

end