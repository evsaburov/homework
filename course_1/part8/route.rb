# frozen_string_literal: true

class Route
  @instances = 0

  require './instance_counter'
  include InstanceCounter
  require './validator'
  include Validator

  attr_reader :start_station, :end_station, :name

  def initialize(name, start_station, end_station)
    @name = name
    validate!
    @start_station = start_station
    @end_station = end_station
    @middle_stations = []
    self.register_instance
  end

  def add_station(stationtion)
    @middle_stations << stationtion
  end

  def del_station(stationtion)
    @middle_stations.delete(stationtion)
  end

  def stations
    routes.each { |s| puts s.name }
  end

  def previous_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    routes[current_index + 1] || current_station
  end

  def next_station(current_station)
    routes = self.routes
    current_index = routes.index(current_station)
    routes[current_index + 1] || current_station
  end

  protected

  def validate!
    raise 'наименование должно быть строкой' unless name.is_a? String
    raise 'имя не должно быть меньше 3 символов' if name.length < 3
  end

  # метод используется только внутри класса. В других объектах не вызывается.
  private

  def routes
    routes = []
    routes << @start_station
    @middle_stations.each { |station| routes << station }
    routes << @end_station
  end
end
