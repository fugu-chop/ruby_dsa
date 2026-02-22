# frozen_string_literal: true

# Node represents the node data structure
# used in Linked Lists and Trees
class Node
  attr_reader :value
  attr_accessor :next

  def initialize(value)
    @value = value
  end
end
