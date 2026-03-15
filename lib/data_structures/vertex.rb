# frozen_string_literal: true

# Vertex represents the Vertex data structure
# with adjacent vertices captured in an
# adjacency hashmap
class Vertex
  attr_accessor :adjacent_vertices
  attr_reader :value

  def initialize(value)
    @value = value
    @adjacent_vertices = {}
  end

  # add_directed_adjacent_vertex adds a vertex
  # as an adjacent, directed vertex
  #
  # @param vertex [Vertex] - the object to insert
  # as an adjacent vertex
  # @return [Vertex] - the vertex inserted
  def add_directed_adjacent_vertex(vertex)
    adjacent_vertices[vertex.value] = vertex
  end

  # add_undirected_adjacent_vertex adds a vertex
  # as an adjacent, undirected vertex
  #
  # @param vertex [Vertex] - the object to insert
  # as an adjacent vertex
  # @return [Vertex] - the vertex inserted
  def add_undirected_adjacent_vertex(vertex)
    return vertex if vertex.adjacent_vertices[vertex.value]

    adjacent_vertices[vertex.value] = vertex
    vertex.add_directed_adjacent_vertex(self)
    vertex
  end
end

# WeightedVertex represents the weighted Vertex
# data structure with adjacent vertices captured
# in an adjacency hash map
class WeightedVertex
  attr_accessor :adjacent_vertices
  attr_reader :value

  def initialize(value)
    @value = value
    @adjacent_vertices = {}
  end

  # add_directed_adjacent_vertex adds a vertex
  # as an adjacent, directed vertex
  #
  # @param vertex [Vertex] - the object to insert
  # as an adjacent vertex
  # @param weight [Integer] - the weight between
  # two WeightedVertex objects
  # @return [Vertex] - the vertex inserted
  def add_directed_adjacent_vertex(vertex, weight)
    adjacent_vertices[vertex] = weight
    vertex
  end
end
