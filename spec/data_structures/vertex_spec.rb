# frozen_string_literal: true

require './lib/data_structures/vertex'

describe Vertex do
  describe 'add_directed_adjacent_vertex' do
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

  describe 'add_undirected_adjacent_vertex' do
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
