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

  describe '.get' do
    it 'should get the front item of queue' do
      queue.add(1)
      queue.add(2)
      queue.add(3)
      expect(queue.get).to eq(1)
    end

    it 'should return Error if get nothing' do
      expect{ queue.get }.to raise_error(Exception)
    end
  end

  describe '.view' do
    it 'should view the front item of queue' do
      queue.add(1)
      queue.add(2)
      queue.add(3)
      expect(queue.view).to eq(1)
    end

    it 'should return Error if view nothing' do
      expect{ queue.view }.to raise_error(Exception)
    end
  end
end