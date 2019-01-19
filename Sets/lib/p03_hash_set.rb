class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    bucket_idx = key.hash % num_buckets

    # if @count == num_buckets
    #   resize!
    #   bucket_idx = key.hash % num_buckets
    #   @store[bucket_idx] << key
    # elsif @store[bucket_idx].include?(key)

    #   bucket_idx = key.hash % num_buckets
    #   @store[bucket_idx] << key
    # end
 
  end

  def include?(key)
  end

  def remove(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
