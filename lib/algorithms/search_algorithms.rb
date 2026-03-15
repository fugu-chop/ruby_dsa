# frozen_string_literal: true

require './lib/algorithms/partitionable'
require './lib/data_structures/vertex'

# SearchAlgorithms represents a series of search
# on an array which may or may not be sorted in
# ascending order
class SearchAlgorithms
  include Partitionable

  attr_reader :array

  def initialize(arr)
    @array = arr
  end

  # binary_search searches the content of a provided
  # Array for value. Expects the provided array to
  # be sorted in ascending order.
  #
  # @param search_value [Any] - the value to search for
  # @return [Integer, nil] - the index at which the
  # element exists, or nil if the element cannot be found
  def binary_search(search_value)
    start_idx = 0
    end_idx = array.length - 1

    while start_idx <= end_idx
      midpoint = (end_idx + start_idx) / 2

      if search_value == array[midpoint]
        return midpoint
      elsif array[midpoint] < search_value
        start_idx = midpoint + 1
      else
        end_idx = midpoint - 1
      end
    end

    nil
  end

  # quickselect finds the nth lowest element of an array
  # sorted in ascending order.
  #
  # @param nth_value [Integer] - the nth lowest value
  # to search for assuming the array is sorted in
  # ascending order
  # @param left_idx [Integer] - the left boundary
  # of the array
  # @param right_idx [Integer] - the right boundary
  # of the array
  # @return [Integer] - the element at `idx` position
  # if the array was sorted ascending.
  def quickselect(nth_value, left_idx = 0, right_idx = array.length - 1)
    return array[left_idx] if right_idx - left_idx <= 0

    pivot_index = partition!(array, left_idx, right_idx)
    if nth_value < pivot_index
      quickselect(nth_value, left_idx, pivot_index - 1)
    elsif nth_value > pivot_index
      quickselect(nth_value, pivot_index + 1, right_idx)
    else # if nth_value == pivot_index
      array[pivot_index]
    end
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
      unvisited_vertices.insert(vertex, weight) unless visited_vertices[vertex]
      weight_through_current_vertex = lowest_weight_table[current_vertex] + weight

      next unless !lowest_weight_table[vertex] ||
                  weight_through_current_vertex < lowest_weight_table[vertex]

      lowest_weight_table[vertex] = weight_through_current_vertex
      lowest_previous_vertex[vertex] = current_vertex
    end

    current_vertex = unvisited_vertices.delete
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
