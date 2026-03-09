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

  describe '#autocomplete' do
    context 'given a trie' do
      it 'returns an array of words if the prefix exists' do
        t = Trie.new
        expect(t.insert('cat')).to eq(nil)
        expect(t.insert('can')).to eq(nil)
        expect(t.insert('cake')).to eq(nil)
        expect(t.insert('cape')).to eq(nil)
        expect(t.insert('case')).to eq(nil)

        result = t.autocomplete('ca')
        expect(result).not_to eq(nil)
        expect(result.size).to eq(5)
        expect(result).to eq(%w[cat can cake cape case])
      end
      it 'returns nil if the prefix does not exist' do
        t = Trie.new
        expect(t.insert('value')).to eq(nil)
        expect(t.insert('valiant')).to eq(nil)
        expect(t.insert('valgus')).to eq(nil)

        expect(t.autocomplete('cat')).to eq(nil)
      end
    end
  end
end
