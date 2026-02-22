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
  # @param idx [Integer] - the index of the node
  # to find
  # @return [Any, nil] - returns the value of the node
  # at position `idx`, or nil if it does not exist
  def read(idx)
    get(idx)&.value
  end

  # index_of attempts to find a node with a value of
  # `value` in the Linked List
  #
  # @param value [Any] - the value to find
  # @return [Integer, nil] - returns the index of the node
  # with value of `value`, or nil if it does not exist
  def index_of(value)
    current_node = head
    current_idx = 0

    while current_node
      return current_idx if current_node.value == value

      current_node = current_node.next

      return nil unless current_node

      current_idx += 1
    end

    nil
  end

  # insert_at attempts to insert a node with a value of
  # `value` in the Linked List at position `idx`
  #
  # @param idx [Integer] - the position to insert the node
  # @param value [Any] - the value to insert
  # @return [Node, nil] - returns the reference to
  # the inserted node, or nil if it cannot be inserted
  def insert_at(idx, value)
    n = Node.new(value)

    if idx.zero?
      n.next = head
      @head = n
      return @head
    end

    prior_node = get(idx - 1)

    return nil unless prior_node

    next_node = prior_node.next

    prior_node.next = n
    n.next = next_node
    n
  end

  private

  def get(idx)
    return nil if idx.negative?

    current_node = head
    current_idx = 0

    while current_idx < idx
      current_node = current_node.next
      return nil unless current_node

      current_idx += 1
    end

    current_node
  end
end
