class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def add(number)
    @head = Node.new(number) if @head.nil?
    @tail = findtail @head
    @tail.next_node = Node.new(number)
    @tail = @tail.next_node
  end

  def findtail(node)
    return node if node.next_node.nil?

    findtail node.next_node
  end

  def get(index)
    indexvalue(@head, index + 1)
  end

  def indexvalue(node, index)
    return node.value if index.zero?

    indexvalue node.next_node, index - 1
  end

  def gethead
    @head.value
  end
end

list = LinkedList.new

list.add(3)
list.add(5)
list.add(6)
list.add(7)
puts list.gethead
puts list.get(2)
# => 5
