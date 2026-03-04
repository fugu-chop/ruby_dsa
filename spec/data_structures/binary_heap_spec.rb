# frozen_string_literal: true

require './lib/data_structures/binary_heap'

describe BinaryHeap do
  describe '#insert' do
    context 'in a min-heap' do
      it 'trickles the smallest node up' do
        heap = BinaryHeap.new

        expect(heap.insert(PriorityNode.new('100', 100))).to eq(100)
        expect(heap.read).to eq(100)

        expect(heap.insert(PriorityNode.new('25', 25))).to eq(25)
        expect(heap.read).to eq(25)

        expect(heap.insert(PriorityNode.new('88', 88))).to eq(88)
        expect(heap.read).to eq(25)

        expect(heap.insert(PriorityNode.new('3', 3))).to eq(3)
        expect(heap.read).to eq(3)
      end
    end
  end

  describe '#delete' do
    context 'in a min-heap' do
      it 'removes the root node' do
        heap = BinaryHeap.new
        expect(heap.insert(PriorityNode.new('100', 100))).to eq(100)
        expect(heap.insert(PriorityNode.new('25', 25))).to eq(25)
        expect(heap.insert(PriorityNode.new('88', 88))).to eq(88)
        expect(heap.insert(PriorityNode.new('3', 3))).to eq(3)

        expect(heap.delete).to eq(3)
        expect(heap.read).to eq(25)

        expect(heap.delete).to eq(25)
        expect(heap.read).to eq(88)
      end
    end
  end
end
