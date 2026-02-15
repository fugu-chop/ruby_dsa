# frozen_string_literal: true

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

  def initialize(arr)
    @array = arr
    @array.freeze
  end

  # rubocop:disable Metrics/AbcSize
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

  # rubocop:enable Metrics/AbcSize
  #
  #
  # selection_sort sorts a provided array (not in-place)
  # using the selection sort algorithm.
  #
  # @return [Array] - the sorted array
  def selection_sort
  end
end
