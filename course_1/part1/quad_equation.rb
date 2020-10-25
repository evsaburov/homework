puts "Введите коэф. a:"
a = gets.chomp.to_f
puts "Введите коэф. b:"
b = gets.chomp.to_f
puts "Введите коэф. c:"
c = gets.chomp.to_f
d = b**2-4*a*c
puts "descr = #{d}"
if(d==0)
  x = -b*(2*a)
  puts "дискриминант D = 0, оба корня одинаковы a = b,x = #{x}"
elsif (d<0)
  puts "Уравнение действительных решений не имеет"
elsif (d>0)
  x1 = (-b+Math.sqrt(d))/2*a
  x2 = (-b-Math.sqrt(d))/2*a
  puts "Два корня, х1=#{x1.round(2)}, x2=#{x2.round(2)}"
end
