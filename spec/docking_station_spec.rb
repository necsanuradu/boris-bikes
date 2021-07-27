require "./lib/docking_station.rb"

describe "DockingStation" do
 it "it should release a bike" do 
  expect(DockingStation.release_bike).to eq(true)
 end
end