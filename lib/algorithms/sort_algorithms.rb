# frozen_string_literal: true

require './lib/algorithms/partitionable'

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

  include Partitionable

  def initialize(arr)
    @array = arr
  end

  #
  # bubble_sort sorts a provided array in ascending order
  # in-place using the bubble sort algorithm.
  #
  # @return [nil] - the array is sorted in place
  def bubble_sort
    end_ptr = array.length - 1
    is_sorted = false

    until is_sorted
      is_sorted = true

      # three dots is exclusive of the final element
      (0...end_ptr).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          is_sorted = false
        end
      end

      end_ptr -= 1
    end
  end

  # selection_sort sorts a provided array in ascending
  # order in-place using the selection sort algorithm.
  #
  # @return [nil] - the array is sorted in place
  def selection_sort
    start_idx = 0

    while start_idx < array.length - 1
      lowest_idx = start_idx
      (start_idx...array.length).each do |idx|
        lowest_idx = idx if array[idx] < array[lowest_idx]
      end
      # no conditional check for swap because the check itself is an operation
      array[lowest_idx], array[start_idx] = array[start_idx], array[lowest_idx]
      start_idx += 1
    end
  end

  # insertion_sort sorts a provided array in ascending
  # order in-place using the insertion sort algorithm.
  #
  # @return [nil] - the array is sorted in place
  def insertion_sort
    (1...array.length).each do |idx|
      temp_value = array[idx]
      position = idx - 1

      until position.negative?
        break unless array[position] > temp_value

        # shift the larger value across, replacing
        # the smaller value as we have saved it
        # to temp_value
        array[position + 1] = array[position]
        position -= 1
      end

      # replace temp value due to shifts rightward
      # The +1 is because `position -= 1` will
      # execute once more than necessary on
      # the final iteration
      array[position + 1] = temp_value
    end
  end

  # quicksort sorts a provided array in ascending
  # order in-place using the quicksort algorithm
  # by recursively partitioning subarrays.
  #
  # @param left_idx [Integer] - the left boundary of the array
  # to partition
  # @param right_idx [Integer] - the right boundary of the array
  # to partition
  # @return [nil] - the array is sorted in place
  def quicksort(left_idx = 0, right_idx = @array.length - 1)
    # Subarray is only one element
    return if right_idx - left_idx <= 0

    pivot_idx = partition!(@array, left_idx, right_idx)

    quicksort(left_idx, pivot_idx - 1)
    quicksort(pivot_idx + 1, right_idx)
  end
end
