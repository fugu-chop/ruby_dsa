# frozen_string_literal: true

require './lib/algorithms/partitionable'

# SearchAlgorithms represents a series of search methods on an array
# which may or may not be sorted in ascending order
class SearchAlgorithms
  include Partitionable

  attr_reader :array

  def initialize(arr)
    @array = arr
  end

  # binary_search searches the content of a provided Array for value.
  # Expects the provided array to be sorted in ascending order.
  #
  # @param search_value [Any] - the value to search for
  # @return [Integer, nil] - the index at which the element exists,
  #   or nil if the element cannot be found
  def binary_search(search_value)
    start_idx = 0
    end_idx = array.length - 1

    while start_idx <= end_idx
      midpoint = (end_idx + start_idx) / 2

      if search_value == array[midpoint]
        return midpoint
      elsif array[midpoint] < search_value
        start_idx = midpoint + 1
      else
        end_idx = midpoint - 1
      end
    end

    nil
  end

  # quickselect finds the nth lowest element of an array, sorted
  # in ascending order.
  #
  # @param nth_value [Integer] - the nth lowest value to search
  # for assuming the array is sorted in ascending order
  # @param left_idx [Integer] - the left boundary of the array
  # @param right_idx [Integer] - the right boundary of the array
  # @return [Integer] - the element at `idx` position, if the array
  # was sorted ascending.
  def quickselect(nth_value, left_idx = 0, right_idx = array.length - 1)
    return array[left_idx] if right_idx - left_idx <= 0

    pivot_index = partition!(array, left_idx, right_idx)
    if nth_value < pivot_index
      quickselect(nth_value, left_idx, pivot_index - 1)
    elsif nth_value > pivot_index
      quickselect(nth_value, pivot_index + 1, right_idx)
    else # if nth_value == pivot_index
      array[pivot_index]
    end
  end
end
