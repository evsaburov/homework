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
    raise "должно быьть указано число " if !count.is_a? Integer 
    raise "число должно быть больше нуля" if count < 0 
  end

end

class PassangerWagon < Wagon
  def initialize(count)
    super
    @places = 0
    @all_places = count
  end

  def all
    @all_places
  end
  
  def taked
    @places
  end
  
  def take
    @places += 1 if @places < @all_places
  end

  def free
    free_place = @all_places - @places 
  end
end

class CargoWagon < Wagon
  
  def initialize(count)
    super
    @volume = 0
    @all_volume = count 
  end

  attr_reader :all_volume 
  
  def all
    @all_volume
  end

  def take(val)
    @volume += val if @volume < @all_volume
  end

  def taked
    @volume
  end

  def free
    @all_volume - @volume
  end

end
