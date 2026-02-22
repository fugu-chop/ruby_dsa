# frozen_string_literal: true

# Queue represents the queue data structure
class Queue
  def initialize
    # TODO: Replace with Node type
    @queue = []
  end

  # enqueue adds an element to the end of the queue
  #
  # @param element [Any] - the element to add to the queue
  # @return [Any] - returns the element added
  def enqueue(element)
    @queue << element
    element
  end

  # dequeue removes the first item of the queue
  # and returns it
  #
  # @return [Any] - returns the element added
  def dequeue
    @queue.shift
  end

  # read returns the first item of the queue
  #
  # @return [Any] - returns the element added
  def read
    @queue.first
  end
end
