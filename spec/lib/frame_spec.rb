require 'spec_helper'
require 'frame'

describe'Frame' do
  describe'#score' do
    let(:next_frame) { Frame.new(6, [5,5]) }

    context 'Standard Frame' do
      context 'first frame' do
        let(:frame) { Frame.new(1, [1,2]) }

        it 'return sum' do
           expect(frame.score).to eq(3)
        end
      end
    end

    context 'Last Frame' do
      context 'not strike' do
        let(:frame) { LastFrame.new(10, [5,4]) }
        it 'return sum' do
          expect(frame.score).to eq(9)
        end
      end

      context 'strike' do
        let(:frame) { LastFrame.new(10, [10,5,5]) }
        it 'return sum' do
           expect(frame.score).to eq(20)
        end
      end
    end

    context 'Strike Frame' do
      let(:frame) { StrikeFrame.new(5, [10,0]) }

      it 'return score' do
        expect(frame.score(next_frame)).to eq(20)
      end
    end

    context 'Spare Frame' do
      let(:frame) { SpareFrame.new(5, [10,0]) }

      it 'return score' do
        expect(frame.score(next_frame)).to eq(15)
      end
    end
  end
end
