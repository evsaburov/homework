class Wagon
  
  require './brand.rb' 
  include Brand
  require './validator.rb'
  include Validator 
  
  attr_reader :count
  attr_accessor :type 
  
  def initialize(count)
    @count = count
    validate!
    @type = self.class
  end
  
  protected

  def validate!
    raise "должно быьть указано число вагонов" if !count.is_a? Integer 
    raise "число вагонов должно быть больше нуля" if count < 0 
  end

end

class PassangerWagon < Wagon
end

class CargoWagon < Wagon
end

