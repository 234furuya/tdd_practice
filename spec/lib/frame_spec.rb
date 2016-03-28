require 'spec_helper'
require 'frame'

describe'Frame' do
  let(:num) { 1 }
  let(:pins) { [1,2] }

  describe '.initialize' do
    context 'Frame' do
      subject { Frame.new(num, pins) }
      
      it 'success' do
        expect(subject.kind_of?(Frame)).to be true
      end  
      
      context 'over 10 pins at a throw' do
        let(:pins) { [11,0] }
        it 'raise Exception' do
          expect{ subject }.to raise_error(Exception)
        end  
      end  
      
      context 'over 10 of sum by 2 throws' do
        let(:pins) { [5,6] }
        it 'raise Exception' do
          expect{ subject }.to raise_error(Exception)
        end
      end  
    end
    
    context 'Last Frame' do
      let(:num) { 10 }
      subject { LastFrame.new(num, pins) }
      
      it 'success' do
        expect(subject.kind_of?(LastFrame)).to be true
      end
      
      context 'over 10 by 3 throws' do
        context 'first strike' do
          let(:pins) { [10,5,5] }
          it 'success' do
            expect(subject.kind_of?(LastFrame)).to be true
          end  
        end
        
        context 'spare' do
          let(:pins) { [1,9,5] }
          it 'success' do
            expect(subject.kind_of?(LastFrame)).to be true
          end  
        end
        
        context 'second strike' do
          let(:pins) { [0,10,5] }
          it 'success' do
            expect(subject.kind_of?(LastFrame)).to be true
          end  
        end
        
        context 'all strikes' do
          let(:pins) { [10,10,10] }
          it 'success' do
            expect(subject.kind_of?(LastFrame)).to be true
          end  
        end  
        
        context 'other' do
          let(:pins) { [1,2,3] }
          it 'raise Exception' do
            expect{ subject }.to raise_error(Exception)
          end  
        end  
      end
    end
  end  
  
  describe'#score' do
    let(:next_frame) { Frame.new(2, [5,5]) }
    let(:two_next_frame) { Frame.new(3, [5,5]) } 

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

      context 'next frame is Frame' do
        it 'return score' do
          expect(frame.score(next_frame, two_next_frame)).to eq(20)
        end
      end
      
      context 'next_frame is StrikeFrame' do
        let(:next_frame) { StrikeFrame.new(2, [10,0]) }
        it 'return score' do
          expect(frame.score(next_frame, two_next_frame)).to eq(25)
        end
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
