class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :games, foreign_key: :player_id

  def total_games_played
    Game.where('player_id = ? OR opponent_id = ?', id, id).count
  end

  def elo
    @elo ||= Elo::Player.new(games_played: total_games_played, rating: score)
  end

end
