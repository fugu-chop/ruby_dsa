# frozen_string_literal: true

require './lib/data_structures/linked_list'
require './lib/data_structures/node'

describe LinkedList do
  a = Node.new('goodbye')
  b = Node.new('cruel')
  c = Node.new('world')
  a.next = b
  b.next = c
  l = LinkedList.new(a)

  describe '#read' do
    context 'given a linked list' do
      it 'returns the node at idx position when it exists' do
        expect(l.read(2)).to eq('world')
      end
      it 'handles negative indices' do
        expect(l.read(-2)).to eq(nil)
      end
      it 'returns nil when the node does not exist' do
        expect(l.read(99)).to eq(nil)
      end
    end
  end

  describe '#index_of' do
    context 'given a linked list' do
      it 'returns the index of the node with a matching value' do
        expect(l.index_of('world')).to eq(2)
      end
      it 'returns nil when a value does not match' do
        expect(l.read(99)).to eq(nil)
      end
    end
  end
end
