class HashSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key.hash)
      self[key.hash] << key
      @count +=1
    end

    if count > num_buckets
      self.resize!
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key.hash].delete(key) 
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num%num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
