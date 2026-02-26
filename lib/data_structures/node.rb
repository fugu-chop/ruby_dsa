# frozen_string_literal: true

# Node represents the node data structure
# used in Linked Lists, Queues and Stacks
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
  end
end

# Node represents the double linked node
# data structure used in Doubly Linked Lists
# or Binary Search Trees
class DoubleLinkedNode
  attr_reader :value
  attr_accessor :next, :prev

  def initialize(value)
    @value = value
  end
end
