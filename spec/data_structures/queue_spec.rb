# frozen_string_literal: true

require './lib/data_structures/queue'

describe Queue do
  describe '#enqueue' do
    context 'given a queue' do
      it 'returns the items pushed' do
        q = Queue.new
        expect(q.enqueue(2)).to eq(2)
        expect(q.enqueue(3)).to eq(3)
      end
    end
  end

  describe '#dequeue' do
    context 'given a queue' do
      it 'dequeues items onto in FIFO order' do
        q = Queue.new
        expect(q.enqueue(2)).to eq(2)
        expect(q.enqueue(3)).to eq(3)
        expect(q.dequeue).to eq(2)
        expect(q.dequeue).to eq(3)
      end
      it 'handles empty queues gracefully' do
        q = Queue.new
        expect(q.dequeue).to eq(nil)
      end
    end
  end

  describe '#reqd' do
    context 'given a queue' do
      it 'reads items FIFO order' do
        q = Queue.new
        expect(q.enqueue(2)).to eq(2)
        expect(q.read).to eq(2)
        expect(q.enqueue(3)).to eq(3)
        expect(q.read).to eq(2)
      end
      it 'handles empty queues gracefully' do
        q = Queue.new
        expect(q.read).to eq(nil)
      end
    end
  end
end
