require_relative "lib/hash_map"
humans = HashMap.new
humans.set("henry", "is a cool guy")
humans.buckets.each do |key_value_pair|
  next if key_value_pair.nil?

  puts key_value_pair
end
p humans.get("henry")
