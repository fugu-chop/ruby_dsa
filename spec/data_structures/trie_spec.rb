# frozen_string_literal: true

require './lib/data_structures/trie'

describe Trie do
  describe '#search' do
    context 'given a trie' do
      it 'returns nil when the word does not exist' do
        trie = Trie.new
        expect(trie.insert('bonk')).to eq(nil)

        expect(trie.search('value')).to eq(nil)
      end
      it 'returns nil when the trie is empty' do
        trie = Trie.new

        expect(trie.search('value')).to eq(nil)
      end
      it 'returns a TrieNode when the word does exist' do
        trie = Trie.new

        expect(trie.insert('value')).to eq(nil)

        result = trie.search('value')
        expect(result).not_to eq(nil)
        expect(result.get('*')).not_to eq(nil)
      end
    end
  end
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
