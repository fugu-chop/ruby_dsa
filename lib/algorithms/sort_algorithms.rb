# frozen_string_literal: true

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

  def initialize(arr)
    @array = arr
  end

  #
  # bubble_sort sorts a provided array (not in-place)
  # using the bubble sort algorithm.
  #
  # @return [Array] - the sorted array
  def bubble_sort
    # #dup allows us to modify the copy of the array
    # where #clone does not
    temp = array.dup
    end_ptr = temp.length - 1
    is_sorted = false

    until is_sorted
      is_sorted = true

      # three dots is exclusive of the final element
      (0...end_ptr).each do |idx|
        if temp[idx] > temp[idx + 1]
          temp[idx], temp[idx + 1] = temp[idx + 1], temp[idx]
          is_sorted = false
        end
      end

      end_ptr -= 1
    end

    temp
  end

  #
  # selection_sort sorts a provided array (not in-place)
  # using the selection sort algorithm.
  #
  # @return [Array] - the sorted array
  def selection_sort
    temp = array.dup
    start_idx = 0

    while start_idx < temp.length - 1
      lowest_idx = start_idx
      (start_idx...temp.length).each do |idx|
        lowest_idx = idx if temp[idx] < temp[lowest_idx]
      end
      # no conditional check for swap because the check itself is an operation
      temp[lowest_idx], temp[start_idx] = temp[start_idx], temp[lowest_idx]
      start_idx += 1
    end

    temp
  end

  # insertion_sort sorts a provided array (not in-place)
  # using the insertion sort algorithm.
  #
  # @return [Array] - the sorted array
  def insertion_sort
    temp = array.dup

    (1...temp.length).each do |idx|
      temp_value = temp[idx]
      position = idx - 1

      until position.negative?
        break unless temp[position] > temp_value

        # shift the larger value across, replacing
        # the smaller value as we have saved it
        # to temp_value
        temp[position + 1] = temp[position]
        position -= 1
      end

      # replace temp value due to shifts rightward
      # The +1 is because `position -= 1` will
      # execute once more than necessary on
      # the final iteration
      temp[position + 1] = temp_value
    end

    temp
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
