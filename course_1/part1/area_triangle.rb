puts "Введете основание(a) треугольника(см):"
a = gets.chomp
puts "Введите высоту(h) треугольника(см)"
h = gets.chomp
result = 1.0/2 * a.to_i * h.to_i
puts "Площадь треугольника равна #{result} см. кв."
