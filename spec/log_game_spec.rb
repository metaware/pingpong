require 'rails_helper'

describe LogGame do

  let(:opponent) { create(:user) }
  let(:player)   { create(:user) }

  context 'valid params' do

    let(:game_params) do
      {
        date_played: Date.today,
        player_score: 21,
        player: player,
        opponent_score: 19,
        opponent: opponent
      }
    end

    it 'should allow a valid game to be logged' do
      response = LogGame.call({ user: player, game_params: game_params })
      expect(response.success?).to eq(true)
    end

  end

  context 'invalid games' do

    let(:response) { LogGame.call({ user: player, game_params: game_params }) }

    context 'cannot log a game against self' do

      let(:game_params) do
        {
          date_played: Date.today,
          player_score: 21,
          player: player,
          opponent_score: 19,
          opponent: player
        }
      end

      it "should not allow such a game to be logged" do
        # response = LogGame.call(game_params)
        expect(response.failure?).to eq(true)
      end

    end

    context 'cannot log a game where either points > 21' do

      let(:game_params) do
        {
          date_played: Date.today,
          player_score: 22,
          player: player,
          opponent_score: 19,
          opponent: player
        }
      end

      it "should not allow such a game to be logged" do
        expect(response.failure?).to eq(true)
      end

    end

    # context 'cannot log games in future' do

    #   let(:game_params) do
    #     {
    #       date_played: Date.today + 2.days,
    #       player_score: 20,
    #       player: player,
    #       opponent_score: 19,
    #       opponent: player
    #     }
    #   end

    #   it "should not allow such a game to be logged" do
    #     expect(response.failure?).to eq(true)
    #   end

    # end

  end

end