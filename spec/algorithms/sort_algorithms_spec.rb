# frozen_string_literal: true

require './lib/algorithms/sort_algorithms'

describe SearchAlgorithms do
  describe '#bubble_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      arr.bubble_sort
      expect(arr.array).to eq([1, 3, 4, 5, 7, 8])
    end
  end

  describe '#selection_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      arr.bubble_sort
      expect(arr.array).to eq([1, 3, 4, 5, 7, 8])
    end
  end

  describe '#insertion_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      arr.insertion_sort
      expect(arr.array).to eq([1, 3, 4, 5, 7, 8])
    end
  end

  describe '#quick_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      arr.quick_sort
      expect(arr.array).to eq([1, 3, 4, 5, 7, 8])
    end
  end

  describe '#merge_sort' do
    arr = SortAlgorithms.new([3, 4, 1, 7, 8, 5])
    it 'returns a sorted array' do
      expect(arr.merge_sort).to eq([1, 3, 4, 5, 7, 8])
    end
    it 'does not mutate the array' do
      expect(arr.array).to eq([3, 4, 1, 7, 8, 5])
    end
  end
end
