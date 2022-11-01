class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    head.next = tail
    tail.prev = head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    if self.empty?
      return nil
    else
       return @head.next
    end
  end

  def last
    if self.empty?
      return nil
    else
      @tail.prev
    end
  end

  def empty?
    head.next == tail && tail.prev == head
  end

  def get(key)

  end

  def include?(key)
  end

  def append(key, val)
    new_node = Node.new(key, val)
    if empty?
      tail.prev = new_node
      new_node.next = tail
      head.next = new_node
      new_node.prev = head
    else
      last.next = new_node
      # new_node = last
      new_node.next = tail
    end
  end

  def update(key, val)
    if self.key == key
      self.val = val
    end
  end

  def remove(key)
  end

  def each
    i = first
    until i == last
      i = i.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
