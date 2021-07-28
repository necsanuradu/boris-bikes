#!/usr/bin/env ruby
require "./lib/bike.rb"

class DockingStation
  attr_reader :docked_bikes
  def initialize
    @docked_bikes = Array.new
  end

  def release_bike
    if(!@docked_bikes.empty?)
      Bike.new
    else 
      raise "No bikes available"
    end
  end

  def docking_bike(bike)
    @bike = bike
    @docked_bikes.push(@bike)
    return @bike
  end

end

