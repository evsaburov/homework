# frozen_string_literal: true

require_relative 'station'
require_relative 'route'
require_relative 'train'
require_relative 'wagon'
require 'pry'

class MainProgram
  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []
  end

  def create_station
    puts 'Введите наименование станции.'
    name = gets.chomp.to_s
    station = Station.new(name)
    @stations << station
    puts "--> Содана станция #{station.name}"
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def create_train
    puts 'Введите номер поезда.'
    number = gets.chomp.to_s

    puts 'Выберете тип поезда 1-пассажирский, 2-грузовой'
    type_selected = gets.chomp.to_i

    case type_selected
    when 1
      train = PassengerTrain.new(number)
      puts "--> Создан #{train.number} пассажирский поезд"
    when 2
      train = CargoTrain.new(number)
      puts "--> Создан #{train.number} грузовой поезд"
    end
    @trains << train
    puts "--> Создан поезд #{train.number}"
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def create_route
    puts 'Введите наименование маршрута.'
    name = gets.chomp.to_s
    puts 'Введите начальную станцию маршрута.'
    start_station = select_station
    puts 'Введите конечную станцию маршрута.'
    end_station = select_station
    route = Route.new(name, start_station, end_station)
    @routes << route
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def add_station_in_route
    puts 'выберете странцию'
    station = select_station
    route = select_route
    route.add_station(station)
    puts "--> станция #{station.name} добавлена на маршрут #{route.name}"
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def del_station_in_route
    station = select_station
    route = select_route
    route.del_station(station)
    puts "--> станция #{station} удалена с маршрут #{route}"
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def control_route
    puts 'Управление маршрутом'
    puts '1 - создать маршрут'
    puts '2 - добавить станцию'
    puts '3 - удалить станию'

    user_respond = gets.chomp.to_i

    case user_respond
    when 1
      create_route
    when 2
      add_station_in_route
    when 3
      del_station_in_route
    end
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def create_wagons
    puts 'Выберете тип вагона 1-пассажирский, 2-грузовой'
    type_selected = gets.chomp.to_i

    if type_selected == 1
      puts 'Выберете количество пассажирских мест'
      place_selected = gets.chomp.to_i
      wagon = PassangerWagon.new(place_selected)
      puts "--> Создан пассажирский вагоно, на #{place_selected} мест "
    else
      puts 'Выберете объем для грузового вагода'
      volume_selected = gets.chomp.to_i
      wagon = CargoWagon.new(volume_selected)
      puts "--> Создан грузовых вагонов, на объем в #{volume_selected}"
    end
    @wagons << wagon
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def assign_route_to_train
    route = select_route
    train = select_train
    train.add_route(route)
    puts "--> Поезду #{train.number} назначен маршрут #{route.name}"
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def add_wagon_to_train
    train = select_train
    wagon = select_wagon
    train.add_carriage(wagon)
    puts '--> вагон добавлен'
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def del_wagon_to_train
    train = select_train
    wagon = select_wagon
    train.del_carriage(wagon)
    puts '--> вагон отцеплен от поезда'
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def view_list
    puts 'выберете действие'
    puts '1 - список станций'
    puts '2 - список поездов на станции'
    number_selected = gets.chomp.to_i
    case number_selected
    when 1
      @stations.each_with_index { |k, v| puts "#{v} #{k.name}" }
    when 2
      puts 'выберете станцию'
      station = select_station
      station.trains
    end
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def add_wagon_to_train
    train = select_train
    wagon = select_wagon
    train.add_carriage(wagon)
    puts '--> вагон добавлен'
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def del_wagon_to_train
    train = select_train
    wagon = select_wagon
    train.del_carriage(wagon)
    puts '--> вагон отцеплен от поезда'
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def move_train
    train = select_train
    puts 'выберете действие'
    puts '1 - перемещать поезд вперед'
    puts '2 - перемещать поезд назад'
    number_selected = gets.chomp.to_i
    case number_selected
    when 1
      train.next_station
      puts '--> поезд перемещен вперед'
    when 2
      train.back_station
      puts '--> поезд перемещен назад'
    end
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def list_wagons_of_train
    train = select_train
    train.each_wagon do |w|
      puts "тип вагона #{w.type}, всего мест/объем #{w.all}. Свободно #{w.free}, занато #{w.taked}."
    end
  end

  def list_trains_on_station
    station = select_station
    station.each_train do |t|
      puts "номер поезда #{t.number}, тип поезда #{t.type}, количество вагонов - #{t.wagons_count} "
    end
  end

  def take_place_in_wagon
    wagon = select_wagon
    puts "введите объем\кол-во мест которое надо занять"
    val_selected = gets.chomp.to_i
    if wagon.is_a? PassangerWagon
      val_selected.times { wagon.take }
    else
      wagon.take(val_selected)
    end
    puts "Занято #{wagon.taked}  мест\объем в вагоне"
  end

  protected

  # Эти методы не являюься частью интерфейса
  def select_station
    puts 'Выберете станцию'
    @stations.each_with_index { |k, v| puts "#{v}-#{k.name}" }
    number_selected = gets.chomp.to_i
    @stations[number_selected]
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def select_route
    puts 'Выберете маршрут'
    @routes.each_with_index { |k, v| puts "#{v}-#{k.name}" }
    number_selected = gets.chomp.to_i
    @routes[number_selected]
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def select_train
    puts 'Выберете поезд'
    @trains.each_with_index { |k, v| puts "#{v}-#{k.number}" }
    number_selected = gets.chomp.to_i
    @trains[number_selected]
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end

  def select_wagon
    puts 'Выберете выгоны'
    @wagons.each_with_index { |k, v| puts "#{v}-#{k.type} #{k.count}" }
    number_selected = gets.chomp.to_i
    @wagons[number_selected]
  rescue RuntimeError => e
    puts "Возникла ошибка: #{e}. Не удалость обработать ответ, попробуйте еще раз."
    retry
  end
end

railway = MainProgram.new

loop do
  puts 'Меню:'
  puts '1 - Соeздать станцию'
  puts '2 - Создать поезд'
  puts '3 - Создать маршруты и управлять станциями в нем (добавлять, удалять)'
  puts '4 - Создать вагон'
  puts '5 - Назначить маршрут поезду'
  puts '6 - Добавить вагоны к поезду'
  puts '7 - Отцепить вагоны от поезда'
  puts '8 - Перемещать поезд по маршруту вперед и назад'
  puts '9 - Просматривать список станций и список поездов на станции'
  puts '10 - Вывести список вагона у поезда'
  puts '11 - Вывести список поездов на странции'
  puts '12 - Занять место или объем в вагоне'
  puts '13 - Выход'
  puts ''

  user_respond = gets.chomp.to_i

  case user_respond
  when 1
    railway.create_station
  when 2
    railway.create_train
  when 3
    railway.control_route
  when 4
    railway.create_wagons
  when 5
    railway.assign_route_to_train
  when 6
    railway.add_wagon_to_train
  when 7
    railway.del_wagon_to_train
  when 8
    railway.move_train
  when 9
    railway.view_list
  when 10
    railway.list_wagons_of_train
  when 11
    railway.list_trains_on_station
  when 12
    railway.take_place_in_wagon
  when 13
    break
  else
    puts '--> Не удалось распознать ответ, попробуйте еще раз.'
  end
end
