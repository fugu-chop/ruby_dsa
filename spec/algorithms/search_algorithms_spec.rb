# frozen_string_literal: true

require './lib/algorithms/search_algorithms'

describe SearchAlgorithms do
  describe '#binary_search' do
    context 'given a sorted array' do
      arr = SearchAlgorithms.new([1, 2, 3, 4, 5, 6])
      it 'returns the index of the element when the element exists' do
        expect(arr.binary_search(4)).to eq(3)
      end
      it 'returns nil when the element does not' do
        expect(arr.binary_search(14)).to eq(nil)
      end
    end
  end

  describe '#quick_select' do
    context 'given an unsorted array' do
      it 'returns the correctly sorted number of the provided index' do
        arr = SearchAlgorithms.new([4, 3, 1, 5, 2, 6])
        expect(arr.quickselect(2)).to eq(3)
        expect(arr.quickselect(4)).to eq(5)
      end
      it 'exits gracefully when the provided index is beyond array bounds' do
        arr = SearchAlgorithms.new([4, 3, 1, 5, 2, 6])
        expect(arr.quickselect(99)).to eq(nil)
      end
    end
  end
end
