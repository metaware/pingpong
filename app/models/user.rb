class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_many :games, foreign_key: :player_id
end
