class MaxIntSet
  attr_accessor :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true 
      # self.validate!
    else 
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store[num] = false if is_valid?(num)
  end

  def include?(num)
    @store[num] == true
  end

  private
  attr_reader :max
  def is_valid?(num)
    num <= @max && num >= 0
  end

  def validate!(num)
    @store[num] = true 
  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    raise false if include?(num)

    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    # num%num_buckets = num
    # @store[num%num_buckets] = @store[num]
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num)
      self[num] << num
      @count +=1
    end

    if count > num_buckets
      self.resize!
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    prev_store = self.store
    # self.count = 0
    prev_num_buckets = num_buckets
    # if num_buckets < count
      until num_buckets > count
        prev_num_buckets *= 2
        self.store = Array.new(prev_num_buckets){Array.new}
      end
    # end

    prev_store.flatten.each{|num| self.store[num] << num}
  end
end
