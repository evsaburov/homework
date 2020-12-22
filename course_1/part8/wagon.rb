# frozen_string_literal: true

class Wagon
  require './brand'
  include Brand
  require './validator'
  include Validator

  attr_reader :count
  attr_accessor :type

  def initialize(count)
    @count = count
    validate!
    @type = self.class
    @resource = 0
    @all_resource = count
  end

  def all
    @all_resource
  end

  def taked
    @resource
  end

  def free
    @all_resource - @resource
  end

  protected

  def validate!
    raise 'должно быьть указано число ' unless count.is_a? Integer
    raise 'число должно быть больше нуля' if count.negative?
  end
end

class PassangerWagon < Wagon
  def take
    @resource += 1 if @resource < @all_resource
  end
end

class CargoWagon < Wagon
  def take(val)
    @resource += val if @resource < @all_resource
  end
end
