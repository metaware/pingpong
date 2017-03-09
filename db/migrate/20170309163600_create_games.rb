class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_played
      t.integer  :player_score
      t.integer  :player_id
      t.integer  :opponent_score
      t.integer  :opponent_id
      t.timestamps null: false
    end
  end
end