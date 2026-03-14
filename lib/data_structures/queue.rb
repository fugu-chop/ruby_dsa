# frozen_string_literal: true

# Queue represents the queue data structure
class Queue
  attr_reader :head, :tail

  # enqueue adds an element to the end of the queue
  #
  # @param value [Any] - the element to add to the queue
  # @return [Any] - returns the `value` added
  def enqueue(value)
    new_node = DoubleLinkedNode.new(value)

    if @head.nil?
      @head = new_node
      @tail = new_node
      return new_node.value
    end

    @tail.next = new_node
    new_node.prev = @tail
    @tail = new_node

    new_node.value
  end

  # dequeue removes the first item of the queue
  # and returns it
  #
  # @return [Any, nil] - returns the `#value` of node removed,
  # or nil if there is no replacement node
  def dequeue
    original = head
    replacement = head&.next

    @head = replacement
    @tail = replacement if replacement&.next.nil?

    original&.value
  end

  # read returns the first item of the queue
  #
  # @return [Any, nil] - returns the element added
  # or nil if there are no nodes left
  def read
    head&.value
  end
end
