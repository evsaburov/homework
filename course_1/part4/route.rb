class Route

  attr_reader :start_station
  attr_reader :end_station
  attr_reader :name

  def initialize(name, start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @middle_stations = []
    @name = name
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
 
  def previous_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    if routes[current_index + 1]
      routes[current_index + 1]
    else
      current_station
    end
  end

  def next_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    if routes[current_index + 1]
      routes[current_index + 1]
    else
      current_station
    end
  end

  #метод используется только внутри класса. В других объектах не вызывается.
  private
  def routes
    routes = []
    routes << @start_station
    @middle_stations.each { |station| routes << station }
    routes << @end_station
  end
end
