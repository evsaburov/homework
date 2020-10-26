print "Введите свое имя:"
name = gets.chomp.to_s
print "Введите свой рост(в сантиметрах):"
height = gets.chomp.to_f

result = (height - 110) * 1.15
if (result < 0)
  puts "Ваш вес уже оптимальный"
else
  puts "#{name.capitalize} Ваш идеальный вес должен быть #{result} кг."
end
