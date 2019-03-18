class LinkedList
  attr_accessor :tail, :head, :size

  def initialize
    @size = 0 
  end

  def append value
    new_node = Node.new value

    if !@head
      @head = new_node
      @tail = @head
    else
      @tail.next_node = new_node
      @tail = new_node
    end
    @size += 1
  end

  def prepend value
    new_node = Node.new value

    if !@head
      @head = new_node
      @tail = @head
    else
      new_node.next_node = @head
      @head = new_node
    end
    @size += 1
  end

  def at index
    if index < 0 || index >= size
      STDERR.puts "ERROR: Out of index"
      return
    end

    selected_node = @head
    index.times do
      selected_node = selected_node.next_node
    end
    selected_node
  end

  def pop
    @tail = self.at(size-2)
    @tail.next_node = nil

    @size -= 1
  end

  def contains? value
    node_selected = @head
    (@size).times do
      return true if node_selected.value == value
      
      node_selected = node_selected.next_node
    end
    false
  end

  def find value
    node_selected = @head
    counter = 0
    @size.times do
      return counter if node_selected.value == value
      
      node_selected = node_selected.next_node
      counter += 1
    end
    nil
  end

  def to_s
    node_selected = @head
    line = ""
    @size.times do
      line += "(#{node_selected.value}) -> "
      node_selected = node_selected.next_node
    end 
    line
  end

  def insert_at index, value
    if index == size-1
      self.append value
      return
    elsif index == 0
      self.prepend value
      return
    end  

    new_node = Node.new value
    new_node.next_node = self.at index
    selected_node = self.at index-1
    selected_node.next_node = new_node
    
    
    @size += 1
  end

  def remove_at index
    if index == size-1
      self.pop
      return
    elsif index == 0
      @head = self.at 1
      @size -= 1
      return
    end

    self.at(index-1).next_node = self.at(index+1)
    @size -= 1
  end
end

class Node
  attr_accessor :next_node, :value

  def initialize param
    @value = param
  end
end

