# frozen_string_literal: true

# SearchAlgorithms represents a series of search methods on a sorted array
class SearchAlgorithms
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
end
