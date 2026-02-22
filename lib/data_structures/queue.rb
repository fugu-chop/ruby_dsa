# frozen_string_literal: true

# Queue represents the queue data structure
class Queue
  attr_reader :head, :tail

  def initialize(value)
    new_node = DoubleLinkedNode.new(value)
    @head = new_node
    @tail = new_node
  end

  # enqueue adds an element to the end of the queue
  #
  # @param value [Any] - the element to add to the queue
  # @return [Node] - returns the Node added
  def enqueue(value)
    new_node = DoubleLinkedNode.new(value)
    tail.next = new_node
    new_node.prev = tail

    @head = new_node if @head.nil?
    @tail = new_node
  end

  # dequeue removes the first item of the queue
  # and returns it
  #
  # @return [Node, nil] - returns the node removed,
  # or nil if there is no replacement node
  def dequeue
    original = head
    replacement = head&.next

    @head = replacement
    @tail = replacement if replacement&.next.nil?

    original
  end

  # read returns the first item of the queue
  #
  # @return [Any, nil] - returns the element added
  # or nil if there are no nodes left
  def read
    head&.value
  end
end
