class LinkedList
  attr_reader :head

  def delete(value)
    previous_node = nil
    current_node = head

    return if current_node.nil?

    until current_node.nil? || current_node.value == value
      previous_node = current_node
      current_node = current_node.next_node
    end

    previous_node.next_node = current_node&.next_node
  end

  def empty?
    head.nil?
  end

  def include?(value)
    traverse { |node| return true if node.value == value }

    false
  end

  def pop
    return nil if empty?

    popped = head
    @head = popped.next_node

    popped.value
  end

  def push(value)
    @head = Node.new(value: value, next_node: head)
  end

  def size
    counter = 0
    traverse { counter += 1 }

    counter
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value:, next_node:)
      @value = value
      @next_node = next_node
    end
  end

  private

  def traverse(&prc)
    current_node = head

    until current_node.nil?
      prc.call(current_node)
      current_node = current_node.next_node
    end
  end
end
