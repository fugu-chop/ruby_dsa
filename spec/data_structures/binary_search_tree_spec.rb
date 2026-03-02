# frozen_string_literal: true

require './lib/data_structures/binary_search_tree'
require './lib/data_structures/node'

describe BinarySearchTree do
  # This creates a binary search tree like:
  #          50
  #      25      75
  #    10  33  56  89
  def create_bst
    b = BinarySearchTree.new(50)
    b.insert(50)
    b.insert(25)
    b.insert(75)
    b.insert(10)
    b.insert(33)
    b.insert(56)
    b.insert(89)
    b
  end

  describe '#insert' do
    context 'insertion of a node' do
      it 'returns a node when the node value does not exist' do
        bst = create_bst

        result = bst.insert(4)
        expect(result).not_to eq(nil)
        expect(result.value).to eq(4)
      end

      it 'returns nil when the value of the node already exists' do
        bst = create_bst

        result = bst.insert(50)
        expect(result).to eq(nil)
      end
    end
  end

  describe '#search' do
    context 'searching for a value' do
      it 'returns the node when the value exists' do
        bst = create_bst

        fifty_six = bst.search(56)
        expect(fifty_six).not_to eq(nil)
        expect(fifty_six.value).to eq(56)

        eighty_nine = bst.search(89)
        expect(eighty_nine).not_to eq(nil)
        expect(eighty_nine.value).to eq(89)
      end

      it 'returns nil if it does not exist' do
        bst = create_bst

        expect(bst.search(99)).to eq(nil)
      end
    end
  end

  describe '#delete' do
    context 'deleting a node' do
      it 'returns the root node if the value does not exist' do
        bst = create_bst

        expect(bst.search(999)).to eq(nil)

        result = bst.delete(999)

        expect(result).not_to eq(nil)
        expect(result.value).to eq(50)
      end
      it 'deletes the node when there are no children' do
        bst = create_bst

        expect(bst.search(10)).not_to eq(nil)

        result = bst.delete(10)

        expect(result).not_to eq(nil)
        expect(bst.search(10)).to eq(nil)
      end
      it 'deletes the node when there is a single child' do
        bst = BinarySearchTree.new(50)
        bst.insert(50)
        bst.insert(25)
        bst.insert(75)
        bst.insert(10)
        # This creates a binary search tree like:
        #          50
        #      25      75
        #    10

        expect(bst.search(25)).not_to eq(nil)

        result = bst.delete(25)

        expect(result).not_to eq(nil)
        expect(bst.search(25)).to eq(nil)
      end
      it 'deletes the node when there are two children' do
        bst = create_bst

        expect(bst.search(25)).not_to eq(nil)

        result = bst.delete(25)

        expect(result).not_to eq(nil)
        expect(bst.search(25)).to eq(nil)
      end
      it 'deletes the node when there are two children and there is a right child' do
        bst = BinarySearchTree.new(50)
        bst.insert(50)
        bst.insert(25)
        bst.insert(75)
        bst.insert(30)
        bst.insert(27)

        # This creates a binary search tree like:
        #          50
        #      25      75
        #         30
        #      27

        result = bst.delete(25)

        expect(result).not_to eq(nil)
        expect(bst.search(25)).to eq(nil)
      end
    end
  end
end
