require 'spec_helper'
require 'string_calculator'

describe 'StringCalculator.run' do

  it 'should return 0 for empty' do
    expect(StringCalculator.run('')).to eq(0)
  end

  it 'should return 3 for 1,2' do
    expect(StringCalculator.run('1,2')).to eq(3)
  end
end