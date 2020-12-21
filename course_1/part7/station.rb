class Station

  require './instance_counter.rb'
  include InstanceCounter
  require './validator.rb'
  include Validator 
  require 'pry'

  @@all_stations = []
  attr_reader :name
  @instances = 0
  
  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@all_stations << self
    self.register_instance
  end

  def each_train(&block)
    @trains.each { |train| block.call(train) }
  end

  def self.all
    @@all_stations.each { |s| puts s.name }
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

  protected

  def validate!
    raise "наименование должно быть строкой" if !name.is_a? String
    raise "имя не должно быть меньше 3 символов" if name.length < 3 
  end

end

