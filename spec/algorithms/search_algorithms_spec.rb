# frozen_string_literal: true

require './lib/algorithms/search_algorithms'
require './lib/data_structures/vertex'

describe SearchAlgorithms do
  describe '#binary_search' do
    context 'given a sorted array' do
      arr = SearchAlgorithms.new([1, 2, 3, 4, 5, 6])
      it 'returns the index of the element when the element exists' do
        expect(arr.binary_search(4)).to eq(3)
      end
      it 'returns nil when the element does not' do
        expect(arr.binary_search(14)).to eq(nil)
      end
    end
  end

  describe '#quick_select' do
    context 'given an unsorted array' do
      it 'returns the correctly sorted number of the provided index' do
        arr = SearchAlgorithms.new([4, 3, 1, 5, 2, 6])
        expect(arr.quickselect(2)).to eq(3)
        expect(arr.quickselect(4)).to eq(5)
      end
      it 'exits gracefully when the provided index is beyond array bounds' do
        arr = SearchAlgorithms.new([4, 3, 1, 5, 2, 6])
        expect(arr.quickselect(99)).to eq(nil)
      end
    end
  end

  describe '#dfs' do
    context 'given a graph structure' do
      it 'finds the associated vertex if the value exists' do
        g = Graph.new
        a = Vertex.new('a', g)
        b = Vertex.new('b', g)
        c = Vertex.new('c', g)
        d = Vertex.new('d', g)
        e = Vertex.new('e', g)

        a.add_undirected_adjacent_vertex(b)
        a.add_undirected_adjacent_vertex(c)
        b.add_undirected_adjacent_vertex(d)
        d.add_undirected_adjacent_vertex(e)

        result = dfs('c', e)

        expect(result).not_to eq(nil)
        expect(result.value).to eq('c')
      end

      it 'returns nil if the value does not exist' do
        g = Graph.new
        x = Vertex.new('x', g)

        result = dfs('c', x)

        expect(result).to eq(nil)
      end
    end
  end

  describe '#bfs' do
    context 'given a graph structure' do
      it 'finds the associated vertex if the value exists' do
        g = Graph.new
        a = Vertex.new('a', g)
        b = Vertex.new('b', g)
        c = Vertex.new('c', g)
        d = Vertex.new('d', g)
        e = Vertex.new('e', g)

        a.add_undirected_adjacent_vertex(b)
        a.add_undirected_adjacent_vertex(c)
        b.add_undirected_adjacent_vertex(d)
        d.add_undirected_adjacent_vertex(e)

        result = bfs('c', e)

        expect(result).not_to eq(nil)
        expect(result.value).to eq('c')
      end

      it 'returns nil if the value does not exist' do
        g = Graph.new
        x = Vertex.new('x', g)

        result = bfs('c', x)

        expect(result).to eq(nil)
      end
    end
  end

  describe 'dijkstra' do
    context 'given a series of WeightedVertex objects' do
      it 'returns the shortest path' do
        cities = Graph.new
        atlanta = WeightedVertex.new('atlanta', cities)
        boston = WeightedVertex.new('boston', cities)
        chicago = WeightedVertex.new('chicago', cities)
        denver = WeightedVertex.new('denver', cities)
        el_paso = WeightedVertex.new('el paso', cities)

        atlanta.add_directed_adjacent_vertex(boston, 100)
        atlanta.add_directed_adjacent_vertex(denver, 160)
        boston.add_directed_adjacent_vertex(denver, 180)
        boston.add_directed_adjacent_vertex(chicago, 120)
        chicago.add_directed_adjacent_vertex(el_paso, 80)
        denver.add_directed_adjacent_vertex(chicago, 40)
        denver.add_directed_adjacent_vertex(el_paso, 140)
        el_paso.add_directed_adjacent_vertex(boston, 100)

        result = dijkstra(atlanta, el_paso)

        expect(result).to eq(['atlanta', 'denver', 'chicago', 'el paso'])
      end
    end
  end
end
