require 'spec_helper'
require 'BowlingGame'
require 'player'
require 'frame'

describe'Bowling Game' do
  let(:player1_name) { 'Player1' }
  let(:player2_name) { 'Player2' }
  let(:game) { BowlingGame.new([player1_name]) }

  describe '#scores' do
    let(:pins) { [[1,2], [3,4], [5,4], [6,3], [7,2], [8,1], [9,0], [0,1], [2,3], [3,4]] }
    context 'no game' do
      it 'return nil at first' do
        expect(game.scores).to eq( { player1_name => 0 } )
      end
    end

    context 'single game' do
      it 'return sum number' do
        game.set_result({player1_name => pins })
        expect(game.scores).to eq( { player1_name => pins.flatten.inject {|sum, n| sum + n } } )
      end
    end
    
    context 'two players game' do
      let(:game) { BowlingGame.new([player1_name, player2_name])}
      it 'return sum number' do
        game.set_result({player1_name => pins, player2_name => pins})
        expect(game.scores).to eq({
          player1_name => pins.flatten.inject {|sum, n| sum + n },
          player2_name => pins.flatten.inject {|sum, n| sum + n }
        } )
      end
    end  
    
    context 'perfect game' do
      let(:pins) { [[10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,0], [10,10,10]] }
      it 'return 300' do
        game.set_result({player1_name => pins})
        expect(game.scores).to eq( { player1_name => 300 } )
      end
    end  
  end

  describe '#set_game_result' do
    subject{ game.set_result({ player1_name => pins }) } 
    context 'valid result' do
      let(:pins) { [[1,2], [3,4], [5,4], [6,3], [7,2], [8,1], [9,0], [0,1], [2,3], [3,4]] }
      it 'create 10 frame' do
        expect(Frame).to receive(:new).exactly(10).times
        subject
      end
    end
  end
end
