class Game < ActiveRecord::Base

  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  validates :player_score, presence: true, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_score, presence: true, numericality: { less_than_or_equal_to: 21 }
  validates :opponent, presence: true

  validate :game_against_self

  def game_against_self
    errors.add(:base, "A game against self cannot be logged") if opponent == player
  end

  def tie?
    opponent_score == player_score
  end

  def player_scored_more?
    player_score > opponent_score
  end

  def opponent_scored_more?
    opponent_score > player_score
  end

  def winner
    return player if player_scored_more?
    return opponent if opponent_scored_more?
  end

  def loser
    return player if opponent_scored_more?
    return opponent if player_scored_more?
  end

  def two_point_margin?
    (player_score - opponent_score).abs >= 2
  end

  def outcome_for(user)
    return :win if user == winner
    return :loss if user == loser
  end

end
