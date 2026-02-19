# frozen_string_literal: true

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

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

  #
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

    pivot_idx = partition!(left_idx, right_idx)

    quicksort(left_idx, pivot_idx - 1)
    quicksort(pivot_idx + 1, right_idx)
  end

  private

  # partition ensures that the element of an array
  # at a 'pivot' index (always set to the last
  # element of the array) is correctly placed within
  # the context of an array (ascending order).
  #
  # @param left_ptr [Integer] - the left index where
  # the partition process begins
  # @param right_ptr [Integer] - the right index where
  # the partition process begins
  # @return [Integer] - the new pivot index
  def partition!(left_ptr, right_ptr)
    # Pin pivot to last item in array
    pivot_idx = right_ptr
    pivot = @array[pivot_idx]

    # Right pointer starts left of pivot
    right_ptr -= 1

    while true
      left_ptr += 1 while @array[left_ptr] < pivot

      right_ptr -= 1 while @array[right_ptr] > pivot

      break if left_ptr >= right_ptr

      @array[left_ptr], @array[right_ptr] = @array[right_ptr], @array[left_ptr]
      left_ptr += 1
    end

    @array[left_ptr], @array[pivot_idx] = @array[pivot_idx], @array[left_ptr]

    # return what is the new pivot index
    left_ptr
  end
end
