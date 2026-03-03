# frozen_string_literal: true

# The Partitionable module provides a partition function designed for
# algorithms that rely on partitioning (quickselect and quicksort).
module Partitionable
  # partition! ensures that the element of an array
  # at a 'pivot' index (always set to the last
  # element of the array) is correctly placed within
  # the context of an array (ascending order).
  #
  # @param left_ptr [Integer] - the left index where
  # the partition process begins
  # @param right_ptr [Integer] - the right index where
  # the partition process begins
  # @return [Integer] - the new pivot index
  def partition!(arr, left_ptr, right_ptr)
    # Pin pivot to last item in array
    pivot_idx = right_ptr
    pivot = arr[pivot_idx]

    # Right pointer starts left of pivot
    right_ptr -= 1

    while true
      left_ptr += 1 while arr[left_ptr] < pivot
      right_ptr -= 1 while arr[right_ptr] > pivot

      break if left_ptr >= right_ptr

      arr[left_ptr], arr[right_ptr] = arr[right_ptr], arr[left_ptr]
      left_ptr += 1
    end

    arr[left_ptr], arr[pivot_idx] = arr[pivot_idx], arr[left_ptr]

    # return what is the new pivot index
    left_ptr
  end

  # random_partition! ensures that the element of an
  # array at a 'pivot' index is correctly placed within
  # the context of an array (ascending order).
  # It differs from `partition!` in that it randomly
  # selects a partition index and swaps it to the end
  # of the array to avoid quadratic time complexity
  # when the array is largely pre-sorted.
  #
  # @param left_ptr [Integer] - the left index where
  # the partition process begins
  # @param right_ptr [Integer] - the right index where
  # the partition process begins
  # @return [Integer] - the new pivot index
  def random_partition!(arr, left_ptr, right_ptr)
    random_pivot_idx = rand(left_ptr..right_ptr)

    arr[random_pivot_idx], arr[right_ptr] =
      arr[right_ptr], arr[random_pivot_idx]

    partition!(arr, left_ptr, right_ptr)
  end
end
