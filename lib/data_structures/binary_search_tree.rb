# frozen_string_literal: true

# BinarySearchTree represents the Binary Search Tree data structure
class BinarySearchTree
  def initialize(value)
    @root = DoubleLinkedNode.new(value)
  end

  # insert adds an element to binary search tree
  #
  # @param value [Any] - the value associated with the node
  # @return [Node, nil] - returns the Node added, or nil
  # if the value of the node already exists
  def insert(value, current_node = @root)
    if value < current_node.value
      return insert(value, current_node.prev) if current_node.prev

      new_node = DoubleLinkedNode.new(value)
      current_node.prev = new_node
      new_node

    elsif value > current_node.value
      return insert(value, current_node.next) if current_node.next

      new_node = DoubleLinkedNode.new(value)
      current_node.next = new_node
      new_node
    end
  end
end
