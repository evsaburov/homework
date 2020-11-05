puts "Enter day:"
day = gets.chomp.to_i
puts "Enter month:"
month = gets.chomp.to_i
puts "Enter year:"
year = gets.chomp.to_i

hyear = {1 => 31, 2 => 28, 3 => 31, 4 => 30, 5 => 31, 6 => 31, 7 => 31, 8 => 31, 9 => 31, 10 => 31, 11 => 31, 12 => 31}

if (year % 4) == 0 && (year % 100) != 0 || (year % 400) == 0
  puts "Високосный год"
  hyear[2] = 29
end

i = 0

hyear.each do |m,d|
  i = (m != month) ? i + d : i + day
  break if m == month
end

puts "Дата #{day}.#{month}.#{year} имеет порядковый номер - #{i}"
