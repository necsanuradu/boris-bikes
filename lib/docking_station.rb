#!/usr/bin/env ruby
require "./lib/bike.rb"
class Object
  def in?(array)
    array.include? (self)
  end
end
class DockingStation
  attr_reader :working_bikes, :capacity
  DEFAULT_CAPACITY = 20
  def initialize(default_capacity = DEFAULT_CAPACITY)
    @capacity = default_capacity
    @working_bikes = Array.new
    @broken_bikes = Array.new
  end

  def release_bike(how_many = 1)
    raise "Not enough working bikes available" if not_enough?(how_many)
    @bikes_to_be_released = @working_bikes.slice!(0,how_many)
    @bikes_to_be_released.last
  end

  def docking_bike(bikes)
    bikes.respond_to?("each") ? @bikes = bikes : @bikes = [bikes]
    raise "Not enough spaces available" if too_many?(@bikes)
    filter_docking_bikes
    @bikes.last
  end

  def filter_docking_bikes
    @bikes.each { |bike| bike.dock_bike_working? ? (@working_bikes << bike) : (@broken_bikes << bike) }
  end
  private
  def not_enough?(how_many)
    how_many > @working_bikes.count
  end

  def too_many?(bikes)
    (@working_bikes.count + @broken_bikes.count + bikes.count) > @capacity
  end

end

