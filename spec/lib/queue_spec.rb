require 'spec_helper'

describe 'Queue Class' do
  let(:queue) { Queue.new }
  describe '.add' do
    it 'should add an item to queue' do
      expect(queue.add).to be true
    end
  end
end