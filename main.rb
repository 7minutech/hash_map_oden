require_relative "lib/hash_map"
humans = HashMap.new
humans.set("henry", "is a cool guy")
humans.set("henry", "is a bad guy")
humans.set("mia", "is a name")
humans.set("mouse", "is an animal")
humans.set("mouse", "is not an animal")
def tester(name, hash)
  puts name
  puts hash.hash(name)
end

def print_hash(hash_map)
  hash_map.buckets.each do |key_value_pair|
    next if key_value_pair.nil?

    puts key_value_pair
  end
end
print_hash(humans)
