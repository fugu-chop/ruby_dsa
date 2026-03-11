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
end
