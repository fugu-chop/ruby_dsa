# frozen_string_literal: true

require './lib/data_structures/trie'

describe Trie do
  describe '#insert' do
    context 'given a trie' do
      it 'inserts a letter when it does not already exist' do
        trie = Trie.new

        expect(trie.insert('value')).to eq(nil)
        expect(trie.root.get('v')).not_to eq(nil)
      end
    end
  end
end
