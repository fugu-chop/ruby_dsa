# frozen_string_literal: true

require './lib/algorithms/sort_algorithms'

describe SearchAlgorithms do
  describe '#bubble_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      expect(arr.bubble_sort).to eq([1, 3, 4, 5, 7, 8])
    end
    it 'does not modify the original array' do
      expect(arr.array).to eq([3, 4, 1, 7, 8, 5])
    end
  end

  describe '#selection_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      expect(arr.bubble_sort).to eq([1, 3, 4, 5, 7, 8])
    end
    it 'does not modify the original array' do
      expect(arr.array).to eq([3, 4, 1, 7, 8, 5])
    end
  end

  describe '#insertion_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      expect(arr.insertion_sort).to eq([1, 3, 4, 5, 7, 8])
    end
    it 'does not modify the original array' do
      expect(arr.array).to eq([3, 4, 1, 7, 8, 5])
    end
  end

  describe '#quicksort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      arr.quicksort
      expect(arr.array).to eq([1, 3, 4, 5, 7, 8])
    end
  end
end
