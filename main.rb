class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      last_node = tail
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    previous_head = @head
    @head = Node.new(value, previous_head)
  end

  def tail(node = @head)
    if @head.nil?
      puts "empty list error"
      return
    end
    if node.next_node == nil
      return node
    end
    tail(node.next_node)
  end

  def size(node = @head)
    if @head.nil?
      return 0
    end

    if node.next_node.nil?
      return 1
    end
    1 + size(node.next_node)
  end

  def at(index)
    number = 0
    node = @head

    loop do
      if number == index
        break node
      end
      node = node.next_node
      if node == nil
        break node
      end
      number += 1
    end
  end

  def pop
    if size == 0
      puts "empty list error"
      return
    end
    penultimate_node = size == 1 ? @tail : at(size - 2)
    penultimate_node.next_node = nil
  end

  def contains?(value, node = @head)
    if node.nil?
      return false
    end
    if node.value == value
      return true
    elsif
      node.next_node == nil
      return false
    end

    contains?(value, node.next_node)
  end

  def find(value, node = @head, index = 0)
    if node.nil?
      return nil
    end
    if node.value == value
      return index
    elsif
      node.next_node == nil
      return nil
    end

    find(value, node.next_node, index + 1)
  end

  def to_s(node = @head, list = "")
    if @head.nil?
      return list
    end

    list += "( #{node.value} ) -> "

    if node.next_node.nil?
      list += "nil"
      return list
    end
    to_s(node.next_node, list)
  end
end

my_list = LinkedList.new
my_list.append("hi")
my_list.append("ihi")
my_list.append("hi")

puts my_list