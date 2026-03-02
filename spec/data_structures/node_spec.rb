# frozen_string_literal: true

require './lib/data_structures/node'

describe Node do
  describe '#value' do
    context 'given a new Node instance' do
      it 'returns the underlying data value' do
        n = Node.new('hello')
        expect(n.value).to eq('hello')
      end
    end
  end

  describe '#next' do
    context 'after linking a new Node instance' do
      n = Node.new('hello')
      it 'returns the linked node' do
        n.next = Node.new('world')

        expect(n.next).not_to eq(nil)
        expect(n.next.value).to eq('world')
      end
      it 'overwrites the linked node' do
        n.next = Node.new('goodbye')

        expect(n.next).not_to eq(nil)
        expect(n.next.value).to eq('goodbye')
      end
    end
  end
end
describe PriorityNode do
  lower = PriorityNode.new('some-value', 1)
  higher = PriorityNode.new('some-other-value', 2)

  describe '#<' do
    context 'given two PriorityNode instances' do
      it 'gets the lower priority value' do
        expect(lower < higher).to eq(true)
      end
    end
  end

  describe '#>' do
    context 'given two PriorityNode instances' do
      it 'gets the higher priority value' do
        expect(higher > lower).to eq(true)
      end
    end
  end
end
