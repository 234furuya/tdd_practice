require 'spec_helper'
require 'BowlingGame'

describe'Bowling Game' do
  let(:player1_name) { 'Player1' }
  let(:game) { BowlingGame.new(player1_name) }

  describe '#scores' do
    context 'no game' do
      it 'return nil at first' do
        expect(game.scores).to eq( { player1_name => nil } )
      end
    end

    context 'game' do
      let(:pins) { [[1,2], [3,4], [5,4], [6,3], [7,2], [8,1], [9,0], [0,1], [2,3], [3,4]] }
      it 'return sum number' do
        game.set_result({player1_name => pins })
        expect(game.scores).to eq( { player1_name => pins.flatten.inject {|sum, n| sum + n } } )
      end
    end
  end

  describe '#set_game_result' do
    context 'valid result' do
      let(:pins) { [[1,2], [3,4], [5,4], [6,3], [7,2], [8,1], [9,0], [0,1], [2,3], [3,4]] }
      it 'create 10 frame' do
        expect{ game.set_result({player1_name => pins }) }.to change(Frame, :count).by(10)
      end

    end

  end
end
