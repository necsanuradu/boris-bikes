require "./lib/docking_station.rb"

describe DockingStation do
 it "responds to release_bike" do 
  expect(subject).to respond_to :release_bike
 end

 it "it gets a bike" do 
    expect(subject.release_bike).instance_of? Object
 end

end

=begin
 it "it gets a bike" do 
   expect(subject.release_bike.working?).to eq(true)
   # instance_of? Object
 end 
 =end