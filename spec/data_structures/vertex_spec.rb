# frozen_string_literal: true

require './lib/data_structures/vertex'

describe Vertex do
  describe '#add_directed_adjacent_vertex' do
    context 'given a vertex' do
      it 'adds a directed vertex' do
        a = Vertex.new('a')
        b = Vertex.new('b')

        result = a.add_directed_adjacent_vertex(b)

        expect(result).to eq(b)
        expect(a.adjacent_vertices['b']).to eq(b)
        expect(b.adjacent_vertices['a']).to eq(nil)
      end
    end
  end

  describe '#add_undirected_adjacent_vertex' do
    context 'given a vertex' do
      it 'adds an undirected vertex' do
        a = Vertex.new('a')
        b = Vertex.new('b')

        result = a.add_undirected_adjacent_vertex(b)

        expect(result).to eq(b)
        expect(a.adjacent_vertices['b']).to eq(b)
        expect(b.adjacent_vertices['a']).to eq(a)
      end
    end
  end
end

describe WeightedVertex do
  describe '#add_directed_adjacent_vertex' do
    context 'given a vertex' do
      it 'adds a directed vertex' do
        a = WeightedVertex.new('a')
        b = WeightedVertex.new('b')

        result = a.add_directed_adjacent_vertex(b, 10)

        expect(result).to eq(b)
        expect(a.adjacent_vertices[b]).to eq(10)
        expect(b.adjacent_vertices[a]).to eq(nil)
      end
    end
  end
end

describe '#dfs' do
  context 'given a graph structure' do
    it 'finds the associated vertex if the value exists' do
      a = Vertex.new('a')
      b = Vertex.new('b')
      c = Vertex.new('c')
      d = Vertex.new('d')
      e = Vertex.new('e')

      a.add_undirected_adjacent_vertex(b)
      a.add_undirected_adjacent_vertex(c)
      b.add_undirected_adjacent_vertex(d)
      d.add_undirected_adjacent_vertex(e)

      result = dfs('c', e)

      expect(result).not_to eq(nil)
      expect(result.value).to eq('c')
    end

    it 'returns nil if the value does not exist' do
      x = Vertex.new('x')

      result = dfs('c', x)

      expect(result).to eq(nil)
    end
  end
end

describe '#bfs' do
  context 'given a graph structure' do
    it 'finds the associated vertex if the value exists' do
      a = Vertex.new('a')
      b = Vertex.new('b')
      c = Vertex.new('c')
      d = Vertex.new('d')
      e = Vertex.new('e')

      a.add_undirected_adjacent_vertex(b)
      a.add_undirected_adjacent_vertex(c)
      b.add_undirected_adjacent_vertex(d)
      d.add_undirected_adjacent_vertex(e)

      result = bfs('c', e)

      expect(result).not_to eq(nil)
      expect(result.value).to eq('c')
    end

    it 'returns nil if the value does not exist' do
      x = Vertex.new('x')

      result = bfs('c', x)

      expect(result).to eq(nil)
    end
  end
end

describe 'dijkstra' do
  context 'given a series of WeightedVertex objects' do
    it 'returns the shortest path' do
      atlanta = WeightedVertex.new('atlanta')
      boston = WeightedVertex.new('boston')
      chicago = WeightedVertex.new('chicago')
      denver = WeightedVertex.new('denver')
      el_paso = WeightedVertex.new('el paso')

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
