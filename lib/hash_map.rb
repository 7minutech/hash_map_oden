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
    raise IndexError if index.negative? || index >= @buckets.lengt

    if @buckets[index].nil?
      @buckets[index] = Node.new(key, value)
    else
      current_node = @buckets[index]
      while current_node.link
        if current_node.key == key
          current_node.value = value
          return
        else
          current_node = current_node.link
        end
      end
      current_node.link = Node.new(key, value)
    end
  end

  def get(key)
    index = hash(key)
    if @buckets[index].nil?
      nil
    elsif @buckets[index].key == key
      @buckets[index].value
    else
      @buckets[index].value if @buckets[index.key] == key while @buckets[index].link
      nil
    end
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
