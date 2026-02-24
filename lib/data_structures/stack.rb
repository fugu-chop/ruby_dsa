# frozen_string_literal: true

# Stack represents the stack data structure
class Stack
  def initialize(value)
    @head = Node.new(value)
  end

  # push adds an element to the stack
  #
  # @param element [Any] - the element to add to the stack
  # @return [Node] - returns the Node added
  def push(element)
    new_node = Node.new(element)
    new_node.next = @head
    @head = new_node
  end

  # pop removes a Node from the stack and returns it
  #
  # @return [Node, nil] - returns the Node on the stack
  # or nil if there is no Node
  def pop
    popped = @head
    @head = @head&.next

    popped
  end

  # read returns the top element on the stack
  #
  # @return [Any, nil] - returns the last element on the stack
  # or nil if there is no Node on the stack
  def read
    @head&.value
  end
end
