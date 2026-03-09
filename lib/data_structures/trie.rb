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
  # @param word [String] - the word to search for
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
  # @param word [String] - the word to insert
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

  # autocomplete attempts to find all words that
  # match the prefix.
  #
  # @param prefix [String] - the prefix of the word to
  # search for
  # @return [Array, nil] - returns an array of words
  # that match the prefix, or nil if the prefix does
  # not exist within the Trie.
  def autocomplete(prefix)
    current_node = search(prefix)

    return nil unless current_node

    all_words(prefix, current_node)
  end

  private

  def all_words(prefix, node = nil, word = '', words = [])
    node ||= root

    node.children.each do |key, childnode|
      if key == '*'
        words.push(prefix + word)
      else
        all_words(prefix, childnode, word + key, words)
      end
    end

    words
  end
end
