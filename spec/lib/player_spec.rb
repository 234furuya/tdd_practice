require 'spec_helper'
require 'player'
require 'frame'

describe 'Player' do
  let(:player1) { Player.new('player1') }
  let(:pins) {[[1,2], [3,4], [5,4], [6,3], [7,2], [8,1], [9,0], [0,1], [2,3], [3,4]]}

  describe '#score' do
    before do
      player1.set_result(pins)    
    end
    
    it 'return score number' do
      expect(player1.score).to eq(pins.flatten.inject {|sum, n| sum + n })    
    end    
  end
  
  describe '#set_result' do
    subject { player1.set_result(pins) }

    context 'valid result' do  
      it 'create 10 frames' do
        expect(player1).to receive(:create_frame).exactly(10).times
        subject
      end
    end
    
    context 'too few items' do
      let(:pins) { pins.shift; pins }
      it 'raise Error' do
        expect{ subject }.to raise_error(Exception)
      end      
    end
    
    context 'too many items' do
      let(:pins) { pins.push([10,0]) }
      it 'raise Error' do
        expect{ subject }.to raise_error(Exception)
      end      
    end
    
    context 'not list' do
      let(:pins) { 100 }
      it 'raise Error' do
        expect{ subject }.to raise_error(Exception)
      end      
    end  
  end
  
  describe '#create_frame' do
    let(:num) { 1 }
    let(:pins) { [1,2] }
    subject { player1.create_frame(num, pins) }
    
    context 'last frame' do  
      let(:num) { 9 }
      it 'create LastFrame' do
        expect(subject.kind_of?(LastFrame)).to be true
      end  
      
      context '3 throws' do
        let(:pins) { [10,5,5] }
        it 'create LastFrame' do
          expect(subject.kind_of?(LastFrame)).to be true
        end        
      end
      
      context 'over 4 throws' do
        let(:pins) { [10,10,10,10] }
        it 'raise Exception' do
          expect{ subject }.to raise_error Exception
        end 
      end
    end
    
    context 'standard frame' do
      it 'create Frame' do
        expect(subject.kind_of?(Frame)).to be true
      end
      
      context '3 throws' do
        let(:pins) { [10,5,5] }
        it 'raise Exception' do
          expect{ subject }.to raise_error Exception
        end        
      end
    end
    
    context 'strike frame' do
      let(:pins) { [10, 0] }
      it 'create StrikeFrame' do
        expect(subject.kind_of?(StrikeFrame)).to be true
      end    
    end
    
    context 'spare frame' do
      let(:pins) {[5,5]}
      it 'create SpareFrame' do
        expect(subject.kind_of?(SpareFrame)).to be true
      end          
    end
  end
  
  describe '#validate_pins_list' do
    let(:pins) { [1,2] }
    subject{ player1.validate_pins_list(pins) }
    
    it 'return true' do
      expect(subject).to be true
    end
    
    context 'only 1 throw' do
      let(:pins) { [1] }
      it 'raise Exception' do
        expect{ subject }.to raise_error Exception
      end  
    end  
    
    context 'not list' do
      let(:pins) { 100 }
      it 'raise Exception' do
        expect{ subject }.to raise_error Exception
      end 
    end  
  end  
end  