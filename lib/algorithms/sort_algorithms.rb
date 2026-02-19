# frozen_string_literal: true

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

  def initialize(arr)
    @array = arr
  end

  #
  # bubble_sort sorts a provided array in-place
  # using the bubble sort algorithm.
  #
  # @return [Array] - the sorted array
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
  # selection_sort sorts a provided array in-place
  # using the selection sort algorithm.
  #
  # @return [Array] - the sorted array
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

  # insertion_sort sorts a provided array in-place
  # using the insertion sort algorithm.
  #
  # @return [Array] - the sorted array
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

  def quicksort(left_idx = 0, right_idx = @array.length - 1)
    # Subarray is only one element
    return if right_idx - left_idx <= 0

    pivot_idx = partition!(left_idx, right_idx)

    quicksort(left_idx, pivot_idx - 1)
    quicksort(pivot_idx + 1, right_idx)
  end

  private

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

    left_ptr
  end
end
