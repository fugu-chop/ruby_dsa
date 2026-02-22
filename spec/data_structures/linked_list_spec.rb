# frozen_string_literal: true

require './lib/data_structures/linked_list'
require './lib/data_structures/node'

describe LinkedList do
  describe '#read' do
    context 'given a linked list' do
      a = Node.new('goodbye')
      b = Node.new('cruel')
      c = Node.new('world')
      a.next = b
      b.next = c
      l = LinkedList.new(a)

      it 'returns the node at idx position when it exists' do
        expect(l.read(2)).to eq('world')
      end
      it 'returns nil when the node does not exist' do
        expect(l.read(99)).to eq(nil)
      end
    end
  end
end
