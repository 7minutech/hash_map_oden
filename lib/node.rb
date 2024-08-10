class Node
  attr_accessor :key, :value, :link

  def initialize(key, value)
    @key = key
    @value = value
    @link = nil
  end

  def to_s
    current_node = self
    output = []
    while current_node
      output.push("[#{current_node.key}, #{current_node.value}]")
      current_node = current_node.link
    end
    output.join(" -> ")
  end
end
