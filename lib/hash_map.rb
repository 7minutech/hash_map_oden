require_relative "node"
require "pry-byebug"
class HashMap
  attr_accessor :buckets

  def initialize
    @buckets = Array.new(16)
    @capacity = @buckets.length
    @load_factor = 0.8
    @entries = 0
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

    current_node = @buckets[index]
    if current_node.nil?
      @buckets[index] = Node.new(key, value)
      @entries += 1
    else
      while current_node.link
        if current_node.key == key
          current_node.value = value
          return
        else
          current_node = current_node.link
        end
      end
      # for last node in bucket
      if current_node.key == key
        current_node.value = value
      else
        current_node.link = Node.new(key, value)
        @entries += 1
      end
    end
  end

  def get(key)
    index = hash(key)
    if @buckets[index].nil?
      nil
    elsif @buckets[index].key == key
      @buckets[index].value
    else
      current_node = @buckets[index]
      while current_node
        return current_node.value if current_node.key == key

        current_node = current_node.link
      end
      nil
    end
  end

  def has?(key)
    index = hash(key)
    current_node = @buckets[index]
    while current_node
      return true if current_node.key == key

      current_node = current_node.link

    end
    false
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
