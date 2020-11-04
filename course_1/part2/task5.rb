puts "Enter day:"
day = gets.chomp.to_i
puts "Enter month:"
month = gets.chomp.to_i
puts "Enter year:"
year = gets.chomp.to_i


if (year % 4) == 0 && (year % 100) != 0 || (year % 400) == 0
  puts "Високосный год"
  hyear = {1 => 31, 2 => 29, 3 => 31, 4 => 30, 5 => 31, 6 => 31, 7 => 31, 8 => 31, 9 => 31, 10 => 31, 11 => 31, 12 => 31}
else
  puts "Не високосный год"
  hyear = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 31, 7 => 31, 8 => 31, 9 => 31, 10 => 31, 11 => 31, 12 => 31}
end

i = 0

hyear.each { |m,d|

 if m != month
   i = i + d 
 else
   i = i + day
 end

 break if m == month
}

puts "Дата #{day}.#{month}.#{year} имеет порядковый номер - #{i}"
