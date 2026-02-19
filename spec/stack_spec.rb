# frozen_string_literal: true

require './lib/data_structures/stack'

describe Stack do
  describe '#push' do
    context 'given a stack' do
      it 'it adds an item to the stack in LIFO order' do
        s = Stack.new
        expect(s.push(3)).to eq(3)
        expect(s.push(2)).to eq(2)
      end
    end
  end

  describe '#pop' do
    context 'given a stack' do
      it 'removes an item from the stack in LIFO order' do
        s = Stack.new
        s.push(3)
        s.push(2)

        expect(s.pop).to eq(2)
        expect(s.pop).to eq(3)
      end

      it 'handles empty stack gracefully' do
        s = Stack.new
        expect(s.pop).to eq(nil)
      end
    end
  end

  describe '#read' do
    context 'given a stack' do
      it 'reads from the top of the stack' do
        s = Stack.new
        s.push(2)

        expect(s.read).to eq(2)

        s.push(3)

        expect(s.read).to eq(3)
      end
    end
  end
end
