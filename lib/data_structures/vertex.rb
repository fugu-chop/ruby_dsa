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

# dfs performs depth-first search on a vertex
#
# @param search_value [Any] - the value being
# searched for
# @param search_vertex [Vertex] - the starting
# vertex where dfs should begin searching
# @param searched_vertices [Hash] - an optional
# parameter that keeps track of which vertices
# have been visited

# @return [Vertex, nil] - the vertex that contains
# the search_value, or nil if a Vertex with search_value
# cannot be found
def dfs(search_value, search_vertex, searched_vertices = {})
  return search_vertex if search_vertex.value == search_value

  searched_vertices[search_vertex.value] = true

  search_vertex.adjacent_vertices.each_value do |vertex|
    next if searched_vertices[vertex.value]

    return dfs(search_value, vertex, searched_vertices)
  end

  nil
end

# bfs performs breadth-first search on a vertex
#
# @param search_value [Any] - the value being
# searched for
# @param search_vertex [Vertex] - the starting
# vertex where dfs should begin searching

# @return [Vertex, nil] - the vertex that contains
# the search_value, or nil if a Vertex with search_value
# cannot be found
def bfs(search_value, search_vertex)
  searched_vertices = {}
  searched_vertices[search_vertex.value] = true

  queue = Queue.new
  queue.enqueue(search_vertex)

  while queue.read
    current_vertex = queue.dequeue
    return current_vertex if current_vertex.value == search_value

    current_vertex.adjacent_vertices.each_value do |vertex|
      return vertex if vertex.value == search_value

      unless searched_vertices[vertex.value]
        searched_vertices[vertex.value] = true
        queue.enqueue(vertex)
      end
    end
  end

  nil
end

# dijkstra attempts to find the lowest weighted
# path between two weighted vertices
#
# @param start_vertex [WeightedVertex] - the
# starting WeightedVertex
# @param end_vertex [WeightedVertex] - the
# ending WeightedVertex
# @return [Array, nil] - an ordered array of
# WeightedVertex nodes to traverse from
# start_vertex to end_vertex, or nil
# if a path cannot be found
def dijkstra(start_vertex, end_vertex)
  lowest_weight_table = {}
  lowest_previous_vertex = {}

  unvisited_vertices = BinaryHeap.new
  visited_vertices = {}

  lowest_weight_table[start_vertex] = 0

  current_vertex = start_vertex

  while current_vertex
    visited_vertices[current_vertex] = true

    current_vertex.adjacent_vertices.each do |vertex, weight|
      unvisited_vertices.insert(PriorityNode.new(vertex, weight)) unless visited_vertices[vertex]
      weight_through_current_vertex = lowest_weight_table[current_vertex] + weight

      next unless !lowest_weight_table[vertex] ||
                  weight_through_current_vertex < lowest_weight_table[vertex]

      lowest_weight_table[vertex] = weight_through_current_vertex
      lowest_previous_vertex[vertex] = current_vertex
    end

    current_vertex = unvisited_vertices.delete&.value
  end

  shortest_path = []
  current_vertex = end_vertex

  while current_vertex != start_vertex
    shortest_path << current_vertex.value
    current_vertex = lowest_previous_vertex[current_vertex]
  end

  shortest_path << start_vertex.value
  shortest_path.reverse
end
