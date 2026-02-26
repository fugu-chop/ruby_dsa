# frozen_string_literal: true

require './lib/data_structures/binary_search_tree'
require './lib/data_structures/node'

describe BinarySearchTree do
  describe '#insert' do
    context 'insertion of a node' do
      it 'returns a node when the node value does not exist' do
        bst = BinarySearchTree.new(50)

        result = bst.insert(5)
        expect(result).not_to eq(nil)
        expect(result.value).to eq(5)
      end

      it 'returns nil when the value of the node already exists' do
        bst = BinarySearchTree.new(50)

        result = bst.insert(50)
        expect(result).to eq(nil)
      end
    end
  end
end
