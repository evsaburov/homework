puts "Введете основание(a) треугольника(см):"
a = gets.chomp.to_f
puts "Введите высоту(h) треугольника(см)"
h = gets.chomp.to_f
result = 0.5 * a * h
puts "Площадь треугольника равна #{result} см. кв."
