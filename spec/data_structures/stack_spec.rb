# frozen_string_literal: true

require './lib/data_structures/stack'

describe Stack do
  describe '#push' do
    context 'given a stack' do
      it 'it adds an item to the stack in LIFO order' do
        s = Stack.new(1)
        expect(s.push(3).value).to eq(3)
        expect(s.push(2).value).to eq(2)
      end
    end
  end

  describe '#pop' do
    context 'given a stack' do
      it 'removes an item from the stack in LIFO order' do
        s = Stack.new(1)
        s.push(3)
        s.push(2)

        expect(s.pop.value).to eq(2)
        expect(s.pop.value).to eq(3)
      end

      it 'handles empty stack gracefully' do
        s = Stack.new(1)
        expect(s.pop).not_to eq(nil)
        expect(s.pop).to eq(nil)
      end
    end
  end

  describe '#read' do
    context 'given a stack' do
      it 'reads from the top of the stack' do
        s = Stack.new(1)
        s.push(2)

        expect(s.read).to eq(2)

        s.push(3)

        expect(s.read).to eq(3)
      end
      it 'handles empty stack' do
        s = Stack.new(1)
        s.pop

        expect(s.read).to eq(nil)
      end
    end
  end
end
