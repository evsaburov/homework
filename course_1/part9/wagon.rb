# frozen_string_literal: true

class Wagon
  require './brand'
  include Brand
  require './validation'
  include Validation

  attr_reader :count
  attr_accessor :type

  def initialize(count)
    @count = count
    @type = self.class
    validate!
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
    validate type, :type, @type
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
