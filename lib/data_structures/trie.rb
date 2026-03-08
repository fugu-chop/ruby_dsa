# frozen_string_literal: true

# Trie represents the Trie data structure
# used for autocomplete use-cases
class Trie
  attr_reader :root

  def initialize
    @root = TrieNode.new
  end

  # search attempts to find a word within the Trie
  # structure.
  #
  # @return [TrieNode, nil] - Return the `*` TrieNode
  # associated with the word, or nil if the word is not
  # found
  def search(word)
    current_node = root

    word.each_char do |letter|
      result = current_node.get(letter)
      return nil unless result

      current_node = result
    end

    current_node
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
