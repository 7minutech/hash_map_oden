require_relative "lib/hash_map"
animals = HashMap.new
animals.set("henry", "is a cool guy")
animals.buckets.each do |key_value_pair|
  if key_value_pair.nil?
    puts " [nil]"
  else
    puts key_value_pair
  end
end
