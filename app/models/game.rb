class Game < ActiveRecord::Base

  belongs_to :player, class_name: 'User'
  belongs_to :opponent, class_name: 'User'

  validates :player_score, numericality: { less_than_or_equal_to: 21 }
  validates :opponent_score, numericality: { less_than_or_equal_to: 21 }

  validate :game_against_self

  def game_against_self
    errors.add(:base, "A game against self cannot be logged") if opponent == player
  end

end
