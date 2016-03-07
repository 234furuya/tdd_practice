require 'spec_helper'
require 'factorial'

describe 'Factorial.calculate' do

  it 'should calculate factorial of 0' do
    expect(Factorial.calculate(0)).to eq 1
  end

  it 'should calculate factorial of 3' do
    expect(Factorial.calculate(3)).to eq 3*2*1
  end

  it 'should calculate factorial of 10' do
    expect(Factorial.calculate(10)).to eq 10*9*8*7*6*5*4*3*2*1
  end

end