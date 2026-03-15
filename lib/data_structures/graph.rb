# frozen_string_literal: true

# Graph represents the graph data structure.
# It is intended to be used with classes
# in vertex.rb as a containing structure

class Graph
  attr_reader :vertices

  def initialize
    @vertices = []
  end

  def add(vertex)
    @vertices << vertex
    vertex
  end
end
