# frozen_string_literal: true

# LinkedList represents the Linked List data structure
class LinkedList
  attr_reader :head

  def initialize(node)
    @head = node
  end

  # read attempts to read the node at position `idx` in
  # a Linked List
  #
  # @param idx [Integer] - the index of the linked list
  # to find
  # @return [Any, nil] - returns the value of the node
  # at position `idx`, or nil if it does not exist
  def read(idx)
    current_node = head
    current_idx = 0

    while current_idx < idx
      current_node = current_node.next
      return nil unless current_node

      current_idx += 1
    end

    current_node.value
  end
end
