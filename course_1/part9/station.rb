# frozen_string_literal: true

class Station
  require './instance_counter'
  include InstanceCounter
  require './validation'
  include Validation

  FORMAT_NUMBER = /\d{3}/.freeze

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

  def trains
    @trains.each { |train| puts train.number }
  end

  def send_train(train)
    @trains.delete(train)
  end

  protected

  def validate!
    validate name, :presence
    validate :station, :type, Station
  end
end
