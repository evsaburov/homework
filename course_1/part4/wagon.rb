class Wagon
  def initialize(count)
    @type = self.set_type
    @count = count
  end
  
  attr_reader :count
  attr_accessor :type 

  #метод используется только у потомков
  protected
  def set_type; end

end

class PassangerWagon < Wagon
  def set_type
    'Passanger'
  end
end

class CargoWagon < Wagon
  def set_type
    'Cargo'
  end
end

