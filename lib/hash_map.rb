require_relative "node"
class HashMap
  attr_accessor :buckets

  def initialize
    @buckets = Array.new(16)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code % 16
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    @buckets[index] = Node.new(key, value)
  end

  def get(key)
    index = hash(key)
    buckets[index].value
  end

  def has?(key)
  end

  def remove(key)
  end

  def length
  end

  def clear
  end

  def keys
  end

  def values
  end

  def entries
  end
end
