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

  attr_reader :start_station
  attr_reader :end_station 

  def initialize(start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @middle_stations = []
  end

  def add_station(stationtion)
    @middle_stations << stationtion
  end

  def del_station(stationtion)
    @middle_stations.delete(stationtion)
  end

  def get_stations
    self.routes.each { |s| puts s.name }
  end

  def routes
    routes = [] 
    routes << @start_station
    @middle_stations.each { |station| routes << station } 
    routes << @end_station
  end

  def previous_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    if routes[current_index - 1].nil?
      current_station
    else
      routes[current_index - 1]
    end
  end

  def next_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    if routes[current_index + 1].nil?
      current_station
    else
      routes[current_index + 1]
    end
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
    @current_station = route.start_station
  end

  def next_station 
    @current_station = @route.next_station(@current_station)
  end 

  def back_station
    @current_station = @route.previous_station(@current_station)
  end 

  def location  
    puts "current station is #{@current_station.name}" 
    puts "last station is #{@route.previous_station(@current_station).name}"
    puts "next station is #{@route.next_station(@current_station).name}"
  end
end

