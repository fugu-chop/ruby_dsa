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

  describe '#==' do
    context 'given a PriorityNode' do
      it 'equates its priority to an integer' do
        expect(higher == 2).to eq(true)
      end
    end
  end
end

describe TrieNode do
  describe '#set' do
    context 'given a TrieNode' do
      it 'setting a letter that already exists is a no-op' do
        x = TrieNode.new
        expect(x.set('a')).not_to eq(nil)

        original_id = x.get('a').object_id

        x.set('a')

        new_id = x.get('a').object_id

        expect(new_id).to eq(original_id)
      end
    end
  end
  describe '#children' do
    context 'given a TrieNode' do
      it 'changing the return value does not mutate the underlying hash' do
        x = TrieNode.new
        expect(x.set('a')).not_to eq(nil)

        original_id = x.get('a').object_id

        x.children['a'] = 'blah'

        expect(x.get('a').object_id).to eq(original_id)
      end
    end
  end
end
