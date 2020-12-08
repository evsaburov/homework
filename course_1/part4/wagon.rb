class Wagon
  def initialize(count)
    @type = self.class
    @count = count
  end
  
  attr_reader :count
  attr_accessor :type 
end

class PassangerWagon < Wagon
end

class CargoWagon < Wagon
end

