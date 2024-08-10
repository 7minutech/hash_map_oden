class Node
  attr_accessor :key, :value, :link

  def initialize(key, value)
    @key = key
    @value = value
    @link = nil
  end

  def to_s
    if nil?
      "nil"
    else
      "[#{@key}, #{@value}]"
    end
  end
end
