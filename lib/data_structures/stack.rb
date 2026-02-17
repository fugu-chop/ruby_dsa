# frozen_string_literal: true

# Stack represents the stack data structure
class Stack
  def initialize
    @stack = []
  end

  # push adds an element to the stack
  #
  # @param element [Any] - the element to add to the stack
  # @return [Any] - returns the element added
  def push(element)
    @stack << element

    element
  end

  # pop removes an element from the stack and returns it
  #
  # @return [Any] - returns the last element on the stack
  def pop
    last = @stack[@stack.length - 1]
    @stack = @stack[0..@stack.length - 2]

    last
  end

  # read returns the last element on the stack
  #
  # @return [Any] - returns the last element on the stack
  def read
    @stack[@stack.length - 1]
  end
end
