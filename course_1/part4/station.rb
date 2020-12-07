class Station

  attr_reader :name

  def initialize(name)
    @name = name
    @trains = []
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

