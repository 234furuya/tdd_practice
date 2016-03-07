require 'spec_helper'
require 'queue'

describe 'Queue Class' do
  let(:queue) { Queue.new }
  describe '.add' do
    it 'should add an item to queue' do
      expect{ queue.add }.to change(queue.list, :length).by(1)
    end
  end
end