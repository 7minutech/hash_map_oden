require_relative "node"
require "pry-byebug"
class HashMap
  attr_accessor :buckets

  def initialize
    @buckets = Array.new(16)
    @capacity = @buckets.length
    @load_factor = 0.75
    @entry = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }

    hash_code % @buckets.length
  end

  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    current_node = @buckets[index]
    # if bucket is empty just add node into it
    if current_node.nil?
      @buckets[index] = Node.new(key, value)
      @entry += 1
      # whenever entry increases
      # need to check if need to double buckets
      grow
    else
      # if bucket is not empty
      # must walk through nodes and comprare keys
      # to decide whether to add a new key or
      # overwrite pre-existing key's value
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
        @entry += 1
        grow
      end
    end
  end

  def get(key)
    index = hash(key)
    # if bucket is empty no key is there
    if @buckets[index].nil?
      nil
    # need to check to see if the first node in bucket
    # matches the key
    elsif @buckets[index].key == key
      @buckets[index].value
    # if a non empty bucket is found
    # need to walk through nodes to find the key value pair
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
    # must walk through all buckets with one or
    # more nodes to find key
    while current_node
      return true if current_node.key == key

      current_node = current_node.link

    end
    false
  end

  def remove(key)
    index = hash(key)
    # if bucket is empty no key is there
    if @buckets[index].nil?
      nil
    # need to check to see if the first node in bucket
    # matches the key
    elsif @buckets[index].key == key
      @entry -= 1
      current_node = @buckets[index]
      # if the first node in the bucket
      # points to nil that is the only node in the bucket
      # only need to make that node nil
      @buckets[index] = if current_node.link.nil?
                          nil
                        # only need to replace the head of the linked list
                        # with the next node
                        else
                          current_node.link
                        end
      # if a non empty bucket is found
      # need to walk through nodes to find the key value pair
    else
      current_node = @buckets[index]
      prev_node = current_node
      while current_node
        if current_node.key == key
          @entry -= 1
          # node before last node needs to point to nill
          # to remove node
          prev_node.link = if current_node.link.nil?
                             nil
                           else
                             # node between tow nodes needs the node
                             # behind it to point to the node in front of it
                             # to remove node
                             current_node.link
                           end
          return
        else
          prev_node = current_node
          current_node = current_node.link
        end
        nil
      end
    end
  end

  def length
    @entry
  end

  def clear
    (0...@buckets.length).each do |index|
      @buckets[index] = nil
    end
    @entry = 0
  end

  def keys
    key_arr = []
    @buckets.each do |node|
      next if node.nil?

      while node
        key_arr.push(node.key)
        node = node.link
      end
    end
    key_arr
  end

  def values
    value_arr = []
    @buckets.each do |node|
      next if node.nil?

      while node
        value_arr.push(node.value)
        node = node.link
      end
    end
    value_arr
  end

  def entries
    output = []
    @buckets.each do |node|
      next if node.nil?

      str = ""
      while node
        str += "[#{node.key}, #{node.value}]"
        output.push(str)
        node = node.link
        str = ""
      end
    end
    output.join(",")
    output.map { |node| puts node }
  end

  def grow
    return unless grow?

    # must alter entry and capacity or
    # an infinte loop will occur b/c grow? continues to be true
    @entry = 0
    copy_of_buckets = @buckets
    # must double after current load factor has been exceeded
    # to distribute the keys more evenly among the buckets
    @buckets = Array.new(@buckets.length * 2)
    @capacity = @buckets.length
    copy_of_buckets.each do |node|
      # must walk through nodes until nil
      # to set nodes that are in the same bucket
      while node
        set(node.key, node.value) unless node.nil?
        node = node.link
      end
    end
  end

  def grow?
    # must check to see if entry has execeed current load factor
    @entry > (@load_factor * @capacity).to_i
  end
end
