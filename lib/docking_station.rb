require "./lib/bike.rb"
class DockingStation
  def release_bike
    return Bike.new
  end
end

# docking_station = DockingStation.new