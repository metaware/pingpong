class Game < ActiveRecord::Base

  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  validates :player_score, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_score, numericality: { less_than_or_equal_to: 21 }
  validates :opponent, presence: true

  validate :game_against_self

  def game_against_self
    errors.add(:base, "A game against self cannot be logged") if opponent == player
  end

  def tie?
    opponent_score == player_score
  end

  def winner
    if (player_score > opponent_score) && two_point_margin?
      player
    elsif (player_score < opponent_score) && two_point_margin?
      opponent
    end
  end

  def loser
    return player if winner == player
    return opponent if winner == opponent
  end

  def two_point_margin?
    (player_score - opponent_score).abs >= 2
  end

  def outcome_for
    # TODO
  end

end
