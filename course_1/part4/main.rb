require_relative 'station.rb'
require_relative 'route.rb'
require_relative 'train.rb'
require_relative 'wagon.rb'

$stations = []
$trains = []
$routes = []
$wagons = []

def create_station
  puts "Введите наименование станции."
  name = gets.chomp.to_s
  station = Station.new(name)
  $stations << station
  puts "Содана станция #{station.name}"
end

def create_train
  puts "Введите номер поезда."
  number = gets.chomp.to_s

  puts "Выберете тип поезда 1-пассажирский, 2-грузовой"
  type_selected = gets.chomp.to_i
  
  if type_selected == 1
    train = PassengerTrain.new(number)
    puts "Создан #{train.number} пассажирский поезд"
  elsif type_selected == 2
    train = CargoTrain.new(number)
    puts "Создан #{train.number} грузовой поезд"
  end
  $trains << train
  puts "Содан поезд #{train.number}"
end

def create_route
  puts "Введите наименование маршрута."
  name = gets.chomp.to_s
  puts "Введите начальную станцию маршрута."
  start_station = select_station
  puts "Введите конечную станцию маршрута."
  end_station = select_station
  route = Route.new(name, start_station, end_station) 
  $routes << route
end

def add_station_in_route
    puts "выберете странцию"
    station = select_station 
    route = select_route
    route.add_station(station)
    puts "станция #{station.name} добавлена на маршрут #{route.name}"
end

def del_station_in_route
    station = select_station 
    route = select_route
    route.del_station(station)
    puts "станция #{station} удалена с маршрут #{route}"
end

def select_station
  #puts "Выберете станцию"
  $stations.each_with_index{ |k,v| puts "#{v}-#{k.name}" }
  number_selected = gets.chomp.to_i
  $stations[number_selected]
end

def select_route
  puts "Выберете маршрут"
  $routes.each_with_index{ |k,v| puts "#{v}-#{k.name}" }
  number_selected = gets.chomp.to_i
  $routes[number_selected]
end

def select_train
  puts "Выберете поезд"
  $trains.each_with_index{ |k,v| puts "#{v}-#{k.number}" }
  number_selected = gets.chomp.to_i
  $trains[number_selected]
end

def select_wagon
  puts "Выберете выгоны"
  $wagons.each_with_index{ |k,v| puts "#{v}-#{k.type} #{k.count}" }
  number_selected = gets.chomp.to_i
  $wagons[number_selected]
end

def control_route
  puts "Управление маршрутом"
  puts "1 - создать маршрут"
  puts "2 - добавить станцию"
  puts "3 - удалить станию"

  user_respond = gets.chomp.to_i 

  case user_respond
    when 1
      create_route
    when 2
      add_station_in_route
    when 
      del_station_in_route
  end

end

def create_wagons
  puts "Выберете тип вагона 1-пассажирский, 2-грузовой"
  type_selected = gets.chomp.to_i
  puts "Выберете количество вагонов"
  count_selected = gets.chomp.to_i
  
  if type_selected == 1
    wagon = PassangerWagon.new(count_selected)
    puts "Создано #{count_selected} пассажирских вагонов "
  else
    wagon = CargoWagon.new(count_selected)
    puts "Создано #{count_selected} грузовых вагонов"
  end
  $wagons << wagon  
end
  
def assign_route_to_train
  route = select_route
  train = select_train
  train.add_route(route)
  puts "Поезду #{train.number} назначен маршрут #{route.name}"
end

def add_wagon_to_train
  train = select_train
  wagon = select_wagon
  train.add_carriage(wagon)
  puts "вагон добавлен"
end

def del_wagon_to_train
  train = select_train
  wagon = select_wagon
  train.del_carriage(wagon)
  puts "вагон отцеплен от поезда"
end

def move_train
  train = select_train
  puts "выберете действие"
  puts "1 - перемещать поезд вперед"
  puts "2 - перемещать поезд назад"
  number_selected = gets.chomp.to_i
  if number_selected == 1
    train.next_station
  puts "поезд перемещен вперед"
  elsif number_selected == 2
    train.back_station
  puts "поезд перемещен назад"
  end
end

def view_list
  puts "выберете действие"
  puts "1 - список станций"
  puts "2 - список поездов на станции"
  number_selected = gets.chomp.to_i
  if number_selected == 1
    $stations.each_with_index{ |k,v| puts "#{v} #{k.name}" }
  elsif number_selected == 2
    puts "выберете станцию"
    station = select_station
    station.get_trains
  end
end

loop do
  puts "Меню:"
  puts "1 - Соeздать станцию"
  puts "2 - Создать поезд"
  puts "3 - Создать маршруты и управлять станциями в нем (добавлять, удалять)"
  puts "4 - Создать вагон"
  puts "5 - Назначить маршрут поезду"
  puts "6 - Добавить вагоны к поезду"
  puts "7 - Отцепить вагоны от поезда"
  puts "8 - Перемещать поезд по маршруту вперед и назад"
  puts "9 - Просматривать список станций и список поездов на станции"
  puts "10 - Выход"
  puts ""
  
  user_respond = gets.chomp.to_i 
  
  case user_respond
  when 1
    create_station
  when 2
    create_train
  when 3
    control_route
  when 4
    create_wagons 
  when 5
    assign_route_to_train
  when 6
    add_wagon_to_train
  when 7
    del_wagon_to_train
  when 8
    move_train  
  when 9
    view_list 
  when 10
    break
  else
    puts "Не удалось распознать ответ, попробуйте еще раз."
  end
end
