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
    @trains.each { |train| puts "Номер поезда #{train.number}. Тип поезда #{train.type}. Количество вагонов #{train.count_carr}" }
  end

  def send_tranin(train)
    @trains.delete(train)
  end
end
 
class Route

  attr_reader :startS
  attr_reader :end_station 

  def initialize(startS, end_station)
    @startS = startS
    @end_station = end_station
    @midle_station = []
  end

  def add_mid_station(stationtion)
    @midle_station << stationtion
  end

  def del_midle_station(stationtion)
    @midle_station.delete(stationtion)
  end

  def get_station
    self.arr_route.each { |s| puts s.name }
  end

  def arr_route
    arr_route = [] 
    arr_route << @startS
    @midle_station.each { |station| arr_route << station } 
    arr_route << @end_station
  end

end

class Train
  
  attr_accessor :cur_station
  attr_accessor :speed
  attr_accessor :route
  attr_reader :number
  attr_reader :count_carr
  attr_reader :type
  
  def initialize(number, type, count_carr)
    @count_carr = count_carr
    @number = number
    @type = type
    @cur_station = nil
    @route = nil
    @speed = 0
  end

  def add_speed
    @speed += 10
  end

  def stop_train
    @speed = 0
  end

  def add_carr
    @count_carr += 1 if @speed == 0
  end

  def del_carr
    @count_carr -= 1 if @speed == 0
  end

 def add_route(route)
   @route = route
   @cur_station = route.startS
 end

 def next_station
   station_index = @route.arr_route.index(@cur_station) 
   @cur_station = @route.arr_route[station_index + 1] unless @route.arr_route[station_index + 1].nil?
 end 

 def back_station
   station_index = @route.arr_route.index(@cur_station) 
   @cur_station = @route.arr_route[station_index - 1] unless @route.arr_route[station_index - 1].nil?
 end 

 def location  
   arr_route = @route.arr_route
   cur_index = arr_route.index(@cur_station)
   puts "current station is #{arr_route[cur_index].name}" unless arr_route[cur_index].nil?
   puts "last station is #{arr_route[cur_index - 1].name}" unless arr_route[cur_index - 1].nil?
   puts "next station is #{arr_route[cur_index + 1].name}" unless arr_route[cur_index + 1].nil?

 end

end

