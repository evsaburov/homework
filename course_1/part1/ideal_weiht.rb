print "Введите свое имя:"
name = gets.chomp
print "Введите свой рост(в сантиметрах):"
height = gets.chomp

result = (height.to_i-110)*1.15
if (result<0)
  puts  ("Ваш вес уже оптимальный")
else
  puts("#{name.capitalize} Ваш идеальный вес должен быть #{result} кг.")
end
