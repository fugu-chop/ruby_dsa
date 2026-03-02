# frozen_string_literal: true

# BinarySearchTree represents the Binary Search Tree data structure
class BinarySearchTree
  def initialize(value)
    @root = DoubleLinkedNode.new(value)
  end

  # insert adds an element to binary search tree
  #
  # @param value [Any] - the value associated with the node
  # @return [Node, nil] - returns the Node added, or nil
  # if the value of the node already exists
  def insert(value, current_node = @root)
    if value < current_node.value
      return insert(value, current_node.prev) if current_node.prev

      new_node = DoubleLinkedNode.new(value)
      current_node.prev = new_node
      new_node

    elsif value > current_node.value
      return insert(value, current_node.next) if current_node.next

      new_node = DoubleLinkedNode.new(value)
      current_node.next = new_node
      new_node
    end
  end

  # search recursively searches for the value within the binary
  # search tree
  #
  # @param value [Any] - the value associated with the node
  # @return [Node, nil] - returns the Node with the correct value
  # or nil if the value does not exist
  def search(value, current_node = @root)
    return current_node if !current_node || value == current_node.value

    return search(value, current_node.prev) if value < current_node.value

    search(value, current_node.next)
  end

  # delete deletes a node within the binary search tree
  # that matches the `value`.
  #
  # It follows the following rules for deletion:
  #
  #   If the node being deleted has no children, simply delete it.
  #
  #   If the node being deleted has one child, delete the node and plug the child
  #   into the spot where the deleted node was.
  #
  #   When deleting a node with two children, replace the deleted node with
  #   the successor node. The successor node is the child node whose value is
  #   the least of all values that are greater than the deleted node.
  #
  #     To find the successor node: visit the right child of the deleted value, and
  #     then keep on visiting the left child of each subsequent child until there
  #     are no more left children. The bottom value is the successor node.
  #
  #     If the successor node has a right child, after plugging the successor node
  #     into the spot of the deleted node, take the former right child of the suc-
  #     cessor node and turn it into the left child of the former parent of the suc-
  #     cessor node.
  #
  # @param value [Any] - the value associated with the node
  # @return [Node, nil] - returns the root Node
  # or nil if the value does not exist
  def delete(value, node = @root)
    return nil unless node

    if value < node.value
      node.prev = delete(value, node.prev)
      return node
    end

    if value > node.value
      node.next = delete(value, node.next)
      return node
    end

    return nil unless value == node.value
    return node.next unless node.prev
    return node.prev unless node.next

    node.next = lift(node.next, node)
    node
  end

  private

  def lift(node, deletion_node)
    if node.prev
      node.prev = lift(node.prev, deletion_node)
      return node
    end

    deletion_node.value = node.value
    node.next
  end
end
