# frozen_string_literal: true

require './lib/data_structures/linked_list'

describe LinkedList do
  def create_linked_list
    l = LinkedList.new('goodbye')
    l.insert_at(1, 'cruel')
    l.insert_at(2, 'world')
    l
  end

  describe '#read' do
    context 'when reading' do
      it 'returns the node at idx position when it exists' do
        l = create_linked_list
        expect(l.read(2)).to eq('world')
      end
      it 'handles negative indices' do
        l = create_linked_list
        expect(l.read(-2)).to eq(nil)
      end
      it 'returns nil when the node does not exist' do
        l = create_linked_list
        expect(l.read(99)).to eq(nil)
      end
    end
  end

  describe '#index_of' do
    context 'when searching for the index of a node' do
      it 'returns the index of the node with a matching value' do
        l = create_linked_list
        expect(l.index_of('world')).to eq(2)
      end
      it 'returns nil when a value does not match' do
        l = create_linked_list
        expect(l.read(99)).to eq(nil)
      end
    end
  end

  describe '#insert_at' do
    context 'when inserting a node' do
      it 'handles insertion at index 0' do
        l = create_linked_list

        expect(l.insert_at(0, 'munch')).not_to eq(nil)
        expect(l.head).not_to eq(nil)
        expect(l.head.value).to eq('munch')
        expect(l.head.next).not_to eq(nil)
        expect(l.head.next.value).to eq('goodbye')
      end
      it 'handles insertion at an index that exists' do
        l = create_linked_list

        expect(l.insert_at(2, 'munch')).not_to eq(nil)
        expect(l.index_of('goodbye')).to eq(0)
        expect(l.index_of('cruel')).to eq(1)
        expect(l.index_of('munch')).to eq(2)
        expect(l.index_of('world')).to eq(3)
      end
      it 'handles insertion at an index that does not exist' do
        l = create_linked_list

        expect(l.insert_at(99, 'what')).to eq(nil)
        expect(l.insert_at(-9, 'what')).to eq(nil)
      end
    end
  end

  describe '#delete_at' do
    context 'when deleting a node' do
      it 'handles deletion at index 0' do
        l = create_linked_list

        expect(l.delete_at(0)).not_to eq(nil)
        expect(l.head).not_to eq(nil)
        expect(l.head.value).to eq('cruel')
        expect(l.head.next).not_to eq(nil)
        expect(l.head.next.value).to eq('world')
        expect(l.head.next.next).to eq(nil)
      end
      it 'handles deletion at an index that exists' do
        l = create_linked_list

        expect(l.delete_at(1)).not_to eq(nil)
        expect(l.index_of('goodbye')).to eq(0)
        expect(l.index_of('world')).to eq(1)
      end
      it 'handles deletion at an index that does not exist' do
        l = create_linked_list

        expect(l.delete_at(99)).to eq(nil)
        expect(l.delete_at(-9)).to eq(nil)
      end
    end
  end
end
