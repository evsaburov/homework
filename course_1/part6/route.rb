class Route

  @instances = 0
  
  require './instance_counter.rb'
  include InstanceCounter

  attr_reader :start_station
  attr_reader :end_station
  attr_reader :name
  
  def initialize(name, start_station, end_station)
    @start_station = start_station
    @end_station = end_station
    @middle_stations = []
    @name = name
    self.register_instance
  end

  def valid?
    validate!
    true
  rescue
    false
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

  protected

  def validate!
    raise "наименование должно быть строкой" if !name.is_a? String
    raise "имя не должно быть меньше 3 символов" if name.length < 3 
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
