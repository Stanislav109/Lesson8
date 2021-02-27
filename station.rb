class Station
  include InstanceCounter

  attr_reader :name, :trains

  def self.all_stations
    @@all_stations
  end

  @@all_stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    register_instance
    @@all_stations << self
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def list_of_trains
    trains.each { |train| yield train } if block_given?
  end

  def get_train(train)
    trains << train
  end

  def send_train(train)
    trains.delete(train)
  end

  protected

  def validate!
    raise "Name can't be nill" if name == '' || name.nil?
  end
end
