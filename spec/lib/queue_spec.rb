require 'spec_helper'
require 'queue'

describe 'Queue Class' do
  let(:queue) { Queue.new }
  describe '.add' do
    it 'should add an item to queue' do
      expect{ queue.add(1) }.to change(queue.list, :length).by(1)
    end

    it 'should raise Error if add more than 5 items' do
      expect{ 6.times{|index| queue.add(index) } }.to raise_error(Exception)
    end
  end
end