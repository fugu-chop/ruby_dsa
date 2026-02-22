# frozen_string_literal: true

# Node represents the node data structure
# used in Linked Lists, Queues, Stacks
# and Trees.
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
  end
end

# Node represents the double linked node
# data structure used in Doubly Linked Lists.
class DoubleLinkedNode
  attr_reader :value
  attr_accessor :next, :prev

  def initialize(value)
    @value = value
  end
end
