class LogGame

  include Interactor

  def call
    game = context.user.games.build(context.game_params)
    if game.valid?
    else
      context.fail!
    end
  end

end