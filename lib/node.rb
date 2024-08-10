class Node
  attr_accessor :value

  def initialize(key, value)
    @key = key
    @value = value
  end

  def to_s
    if nil?
      "nil"
    else
      "[#{@key}, #{@value}]"
    end
  end
end
