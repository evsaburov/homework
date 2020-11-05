total = {}
while true 
  puts "Введите назавание товара:"
  name = gets.chomp.to_s
  break if name == 'стоп'
  puts "Введите цену товара:"
  price = gets.chomp.to_f.round(2)
  puts "Введите количество товара:"
  count = gets.chomp.to_i

  total[name] = { price: price, count: count }
end

puts total

toal_price = 0

total.each { |k,v| 
  full_price = v[:price] * v[:count]
  puts "name: #{k}, full price:#{full_price}"
  toal_price += full_price.round(2)

}

puts "total price: #{toal_price}" 
