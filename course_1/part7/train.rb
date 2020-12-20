class Train
 
  require './brand.rb' 
  include Brand
  require './instance_counter.rb'
  include InstanceCounter
  require './validator.rb'
  include Validator 
  require 'pry'

  attr_accessor :current_station
  attr_accessor :speed
  attr_accessor :route
  attr_reader :number
  attr_reader :type
  

  FORMAT_NUMBER = /[A-Za-z]{3}-?\d{3}/

  @@trains = {}
  @instances = 0

  def initialize(number)
    @number = number
    validate!
    @type = self.class  
    @current_station 
    @speed = 0
    @wagons = []
    @route
    @@trains[self.number] = self
    self.register_instance
  end

  def wagons_count
    @wagons.length  
  end

  def block_wagons(&block)
    @wagons.each { |w| block.call(w) }
  end

  def self.find(number)
    @@trains[number]
  end

  def add_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_carriage(wagon)
    if self.my_wagon?(wagon)
      @wagons << wagon 
    else
      puts "Тип вагона не соответствует типу поезда"
    end
  end

  def del_carriage(wagon)
    @wagons.delete(wagon)
  end

  def add_route(route)
    @route = route
    @current_station = route.start_station
    @current_station.enter_train(self)
  end
  
  def next_station 
    @current_station.send_train(self)
    @current_station = @route.next_station(@current_station)
    @current_station.enter_train(self)
  end

  def back_station
    @current_station.send_train(self)
    @current_station = @route.previous_station(@current_station)
    @current_station.enter_train(self)
  end

  def location
    puts "current station is #{@current_station.name}"
    puts "last station is #{@route.previous_station(@current_station).name}"
    puts "next station is #{@route.next_station(@current_station).name}"
  end
  
  protected 
  def validate!
    raise "наименование должно быть строка" if !number.is_a? String 
    raise "номер не соответствует формату БББ-ЦЦЦ" if number !~ FORMAT_NUMBER 
  end

  private
  #метод использутеся толко внутри класса. Для проверки условия.
  def my_wagon?(wagon)
    if self.is_a? PassengerTrain and wagon.is_a? PassangerWagon
      true
    elsif self.is_a? CargoTrain and wagon.is_a? CargoWagon
      true
    else
      false
    end
  end
  
  #метод использутеся толко внутри класса. Для проверки условия.
  def stoped?
    @speed.zero  
  end

end

class PassengerTrain < Train
  @instances = 0
end

class CargoTrain < Train
  @instances = 0
end
