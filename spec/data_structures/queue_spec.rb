# frozen_string_literal: true

require './lib/data_structures/queue'

describe Queue do
  describe '#enqueue' do
    context 'when enqueing node to the queue' do
      it 'returns the items pushed' do
        q = Queue.new(1)
        expect(q.enqueue(2)).not_to eq(nil)
        expect(q.enqueue(2).value).to eq(2)
        expect(q.enqueue(3)).not_to eq(nil)
        expect(q.enqueue(3).value).to eq(3)
      end
    end
  end

  describe '#dequeue' do
    context 'when dequeing node from a queue' do
      it 'dequeues items onto in FIFO order' do
        q = Queue.new(1)
        expect(q.enqueue(2).value).to eq(2)
        expect(q.dequeue.value).to eq(1)
        expect(q.head.value).to eq(2)
        expect(q.dequeue.value).to eq(2)
      end
      it 'handles empty queues gracefully' do
        q = Queue.new(1)
        expect(q.dequeue.value).to eq(1)
        expect(q.dequeue).to eq(nil)
      end
    end
  end

  describe '#read' do
    context 'when reading from a queue' do
      it 'reads items FIFO order' do
        q = Queue.new(1)
        expect(q.enqueue(2)).not_to eq(nil)
        expect(q.read).to eq(1)
      end
      it 'handles empty queues gracefully' do
        q = Queue.new(1)
        expect(q.dequeue.value).to eq(1)
        expect(q.read).to eq(nil)
      end
    end
  end
end
