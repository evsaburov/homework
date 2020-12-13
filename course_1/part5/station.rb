class Station

  require './instance_counter.rb'
  include InstanceCounter

  @@all_stations = []
  attr_reader :name
  @instances = 0


  def self.all
    @@all_stations.each { |s| puts s.name }
  end

  def initialize(name)
    @name = name
    @trains = []
    @@all_stations << self
    self.register_instance
  end

  def enter_train(train)
    @trains << train
  end

  def get_trains
    @trains.each{ |train| puts train.number }
  end

  def send_train(train)
    @trains.delete(train)
  end
end

