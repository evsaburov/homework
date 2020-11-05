hash = {}
arr = ['a','e','i','o','u']
('a'..'z').each.with_index(1) do |k,v|
  arr.each { |y| hash[k] = v  if k == y }
end
puts hash
