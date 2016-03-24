require 'spec_helper'
require 'FizzBuzz1to100'

 describe'Fizz Buzz 1 to 100' do
  it 'print 1' do
    expect{FizzBuzz.calc}.to output('12Fizz4Buzz').to_stdout
  end
end
