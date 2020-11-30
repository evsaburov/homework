class Station

  attr_reader :name 

  def initialize(name)
    @name = name
    @trains = []
  end

  def enter_train(train)
    @trains << train
  end

  def get_trains
    @trains.each{ |train| puts train.number }
  end

  def get_trains_type
    @trains.each { |train| puts "Номер поезда #{train.number}. Тип поезда #{train.type}. Количество вагонов #{train.count_carriage}" }
  end

  def send_tranin(train)
    @trains.delete(train)
  end
end
 
class Route

  attr_reader :startS
  attr_reader :endS 

  def initialize(startS, endS)
    @startS = startS
    @endS = endS
    @midleS = []
  end

  def add_station(stationtion)
    @midleS << stationtion
  end

  def del_station(stationtion)
    @midleS.delete(stationtion)
  end

  def get_station
    self.arr_route.each { |s| puts s.name }
  end

  def arr_route
    routeS = [] 
    routeS << @startS
    @midleS.each { |station| arr_route << station } 
    arr_route << @endS
  end

end

class Train
  
  attr_accessor :current_station
  attr_accessor :speed
  attr_accessor :route
  attr_reader :number
  attr_reader :count_carriage
  attr_reader :type
  
  def initialize(number, type, count_carriage)
    @count_carriage = count_carriage
    @number = number
    @type = type
    @current_station 
    @route
    @speed = 0
  end

  def add_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def stoped?
    @speed.zero  
  end

  def add_carriage
    @count_carriage += 1 if self.stoped? 
  end

  def del_carriage
    @count_carriage -= 1 if self.stoped?
  end

 def add_route(route)
   @route = route
   @current_station = route.startS
 end

 def next_station
   station_index = @route.arr_route.index(@current_station) 
   @current_station = @route.arr_route[station_index + 1] if @route.arr_route[station_index + 1]
 end 

 def back_station
   station_index = @route.arr_route.index(@current_station) 
   @current_station = @route.arr_route[station_index - 1] if @route.arr_route[station_index - 1]
 end 

 def location  
   arr_route = @route.arr_route
   cur_index = arr_route.index(@current_station)
   puts "current station is #{arr_route[cur_index].name}" if arr_route[cur_index]
   puts "last station is #{arr_route[cur_index - 1].name}" if arr_route[cur_index - 1]
   puts "next station is #{arr_route[cur_index + 1].name}" if arr_route[cur_index + 1]
 end
end

