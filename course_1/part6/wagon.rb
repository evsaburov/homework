class Wagon
  
  require './brand.rb' 
  include Brand
  
  attr_reader :count
  attr_accessor :type 
  
  def initialize(count)
    @type = self.class
    @count = count
  end
  
  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise "должно быьть указано число вагонов" if !count.is_a? Integer 
    raise "число вагонов должно быть больше нуля" if count.length > 0 
  end

end

class PassangerWagon < Wagon
end

class CargoWagon < Wagon
end

