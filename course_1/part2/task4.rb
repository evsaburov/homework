hash = {}
i = 0
arr = ['a','e','i','o','u']
('a'..'z').each{ |k|
  i += 1
  arr.each { |y| hash[k] = i if k == y }
}
puts hash
