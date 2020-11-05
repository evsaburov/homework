arr = [0, 1]
x = 0
f = 0
while f < 100
  x += 1
  f = arr[x - 1] + arr[x]
  arr << f unless f > 100 
end

puts arr
