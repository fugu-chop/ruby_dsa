# frozen_string_literal: true

# BinaryHeap represents the Binary Heap data structure
# as a min-heap
class BinaryHeap
  def initialize
    @heap = []
  end

  # insert adds the value to the heap in a
  # way that preserves the min-heap condition
  def insert(value)
    @heap.push(value)

    trickle_idx = @heap.length - 1

    while trickle_idx.positive? && larger_parent?(trickle_idx)
      @heap[parent_idx(trickle_idx)], @heap[trickle_idx] =
        @heap[trickle_idx], @heap[parent_idx(trickle_idx)]

      trickle_idx = parent_idx(trickle_idx)
    end
  end

  # delete removes the root value in the heap and
  # reorders the heap to preserve the min-heap
  # condition
  def delete
  end

  # read returns the root node of the heap; i.e.
  # the smallest value in the heap.
  #
  # @return [Any, nil] - returns the smallest element
  # of the heap, or nil if the heap is empty
  def read
    @heap[0]
  end

  private

  def larger_parent?(idx)
    parent = parent_idx(idx)
    parent >= 0 && @heap[parent] > @heap[idx]
  end

  def parent_idx(idx)
    (idx - 1) / 2
  end
end
