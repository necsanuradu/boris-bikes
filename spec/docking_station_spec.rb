require "./lib/docking_station.rb"

describe DockingStation do
 it "responds to release_bike" do 
  expect(subject).to respond_to :release_bike
 end
end