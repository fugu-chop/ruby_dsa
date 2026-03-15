# frozen_string_literal: true

require './lib/data_structures/vertex'

describe Vertex do
  describe '#add_directed_adjacent_vertex' do
    context 'given a vertex' do
      it 'adds a directed vertex' do
        g = Graph.new
        a = Vertex.new('a', g)
        b = Vertex.new('b', g)

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
        g = Graph.new
        a = Vertex.new('a', g)
        b = Vertex.new('b', g)

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
        g = Graph.new
        a = WeightedVertex.new('a', g)
        b = WeightedVertex.new('b', g)

        result = a.add_directed_adjacent_vertex(b, 10)

        expect(result).to eq(b)
        expect(a.adjacent_vertices[b]).to eq(10)
        expect(b.adjacent_vertices[a]).to eq(nil)
      end
    end
  end
end
