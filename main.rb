require_relative "lib/hash_map"
test = HashMap.new
test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")
def tester(name, hash)
  puts name
  puts hash.hash(name)
end

def display_hash(hash_map)
  hash_map.buckets.each do |key_value_pair|
    print "nil" if key_value_pair.nil?
    puts key_value_pair
  end
  puts "----------------------------"
end

test.entries
