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

# DoubleLinkedNode represents the double
# linked node data structure used in
# Doubly Linked Lists or Binary Search Trees
class DoubleLinkedNode
  attr_accessor :next, :prev, :value

  def initialize(value)
    @value = value
  end
end

# PriorityNode represents a node
# data structure used in Binary Heap
class PriorityNode
  attr_reader :value, :priority

  def initialize(value, priority)
    @value = value
    @priority = priority
  end

  def ==(other)
    priority == other.to_i
  end

  def <(other)
    priority < other.priority
  end

  def >(other)
    priority > other.priority
  end
end

# TrieNode represents a node
# data structure used in a Trie
class TrieNode
  def initialize
    @children = {}
  end

  def children
    @children.dup
  end

  def get(letter)
    @children[letter]
  end

  def set(letter)
    return if @children[letter]

    @children[letter] = TrieNode.new
  end
end
