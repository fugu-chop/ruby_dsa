# frozen_string_literal: true

# BinaryHeap represents the Binary Heap data structure
# as a min-heap
class BinaryHeap
  def initialize
    @heap = []
  end

  # insert adds the value to the heap in a
  # way that preserves the min-heap condition
  #
  # @param value [Integer] - the value to insert
  # @return [Any] - returns the value added
  def insert(value)
    @heap.push(value)

    trickle_idx = @heap.length - 1

    while trickle_idx.positive? && larger_parent?(trickle_idx)
      @heap[parent_idx(trickle_idx)], @heap[trickle_idx] =
        @heap[trickle_idx], @heap[parent_idx(trickle_idx)]

      trickle_idx = parent_idx(trickle_idx)
    end

    value
  end

  # delete removes the root value in the heap and
  # reorders the heap to preserve the min-heap
  # condition
  #
  # @return [Any] - returns the value deleted
  def delete
    popped_value = @heap[0]
    replacement = @heap.pop
    @heap[0] = replacement if @heap.size > 1

    current_idx = 0

    while lesser_child?(current_idx)
      child_idx = lesser_child_idx(current_idx)
      @heap[child_idx], @heap[current_idx] =
        @heap[current_idx], @heap[child_idx]

      current_idx = child_idx
    end

    popped_value
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

  def lesser_child?(idx)
    (!left_child(idx).nil? && left_child(idx) < @heap[idx]) ||
      (!right_child(idx).nil? && right_child(idx) < @heap[idx])
  end

  def left_child(idx)
    @heap[(2 * idx - 1)]
  end

  def right_child(idx)
    @heap[(2 * idx + 1)]
  end

  def lesser_child_idx(idx)
    left = (2 * idx - 1)
    right = (2 * idx + 1)

    return right if !right_child(idx).nil? &&
                    right_child(idx) < left_child(idx)

    left
  end
end
