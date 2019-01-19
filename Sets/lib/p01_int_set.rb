require "byebug"

class MaxIntSet
  attr_reader :store, :max
  def initialize(max)
    @store = Array.new(max)
    @max = max
  end

  def insert(num)
    if num > max || num < 0
      raise ArgumentError.new("Out of bounds")
    else
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  attr_reader :store  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_idx = num % @store.length
    @store[bucket_idx] << num
  end

  def remove(num)
    @store[num].each do |el|
      @store[num].delete(el)
    end

  end

  def include?(num)
    bucket_idx = num % @store.length
    @store[bucket_idx].each do |el|
      return true if el == num
    end
      
    false
  end

  private

  def [](num)

    # optional but useful; return the bucket corresponding to `num`
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
    if @count == num_buckets
      resize!
    end

    bucket_idx = num % num_buckets

    unless @store[bucket_idx].include?(num)
      @store[bucket_idx] << num
      @count += 1
    end
  end

  def remove(num)
    bucket_idx = num % num_buckets

    if @store[bucket_idx].include?(num)
      @store[bucket_idx].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    bucket_idx = num % num_buckets

    @store[bucket_idx].include?(num) ? true : false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_set = Array.new(num_buckets * 2) { Array.new }

    @store.each do |bucket|
      bucket.each do |el|
        bucket_idx = el % new_set.length
        new_set[bucket_idx] << el
      end
    end
    
    @store = new_set
  end

end
