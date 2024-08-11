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

test.entries
test.set("lion", "purple")
puts ""
test.entries
test.set("moon", "silver")
puts ""
puts test.get("moon")
puts test.has?("moon")
test.remove("moon")
puts ""
test.entries
puts test.length
puts test.keys
puts test.values
test.clear
test.entries
