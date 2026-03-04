# frozen_string_literal: true

# Trie represents the Trie data structure
# used for autocomplete use-cases
class Trie
  attr_reader :root

  def initialize
    @root = TrieNode.new
  end

  # insert attempts to add a word to the trie
  # by converting each letter of a word to a
  # TrieNode class.
  #
  # If a letter is already represented as a TrieNode,
  # it is not mutated.
  #
  # @return [nil]
  def insert(word)
    current_node = root

    word.each_char do |letter|
      result = current_node.get(letter)
      if result
        current_node = result
        next
      end

      current_node.set(letter)
      current_node = current_node.get(letter)
    end

    current_node.set('*')
    nil
  end
end
