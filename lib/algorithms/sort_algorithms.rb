# frozen_string_literal: true

# SortAlgorithms represents a series of sort methods on an unsorted array
class SortAlgorithms
  attr_reader :array

  def initialize(arr)
    @array = arr
    @array.freeze
  end

  def bubble_sort
    temp = array.dup
    end_ptr = temp.length - 1
    is_sorted = false

    until is_sorted
      is_sorted = true

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
end
