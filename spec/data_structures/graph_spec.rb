# frozen_string_literal: true

require './lib/data_structures/graph'
require './lib/data_structures/vertex'

describe Graph do
  describe '#add' do
    context 'given a graph' do
      it 'adds a vertex to the graph' do
        g = Graph.new
        a = Vertex.new('a')

        expect(g.add(a)).to eq(a)
        expect(g.vertices.size).to eq(1)
      end
    end
  end
end
