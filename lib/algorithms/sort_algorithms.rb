# frozen_string_literal: true

require './lib/algorithms/partitionable'

# SortAlgorithms represents a series of methods to sort an
# unsorted array in ascending order
class SortAlgorithms
  attr_reader :array

  include Partitionable

  def initialize(arr)
    @array = arr
  end

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
      # no conditional check for swap because
      # the check itself is an operation
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

  # quick_sort sorts a provided array in ascending
  # order in-place using the quicksort algorithm
  # by recursively partitioning subarrays.
  #
  # @param left_idx [Integer] - the left boundary of
  # the array to partition
  # @param right_idx [Integer] - the right boundary
  # of the array to partition
  # @return [nil] - the array is sorted in place
  def quick_sort(left_idx = 0, right_idx = @array.length - 1)
    # Subarray is only one element
    return if right_idx - left_idx <= 0

    pivot_idx = partition!(@array, left_idx, right_idx)

    quick_sort(left_idx, pivot_idx - 1)
    quick_sort(pivot_idx + 1, right_idx)
  end

  # merge_sort sorts a provided array in ascending
  # order using the merge sort algorithm that
  # recursively splits the array into single
  # element subarrays and reassembles them in
  # ascending order.
  #
  # @return [Array] - the original array is not
  # sorted in place
  def merge_sort(array = @array)
    return array if array.length <= 1

    mid = array.length / 2
    left_half = merge_sort(array[0...mid])
    right_half = merge_sort(array[mid..])

    merge(left_half, right_half)
  end

  private

  def merge(left, right)
    result = []
    i = 0
    j = 0

    while i < left.length && j < right.length
      if left[i] <= right[j]
        result << left[i]
        i += 1
      else
        result << right[j]
        j += 1
      end
    end

    # Append remaining elements as the recursive
    # merge process ensures both arrays are in
    # ascending order
    result.concat(left[i..]) if i < left.length
    result.concat(right[j..]) if j < right.length

    result
  end
end
