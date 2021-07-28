require "./lib/docking_station.rb"

describe DockingStation do
  it "responds to release_bike" do 
    expect(subject).to respond_to :release_bike
  end

  it "it gets a bike" do 
    bike = subject.docking_bike(Bike.new)
    expect(subject.release_bike.instance_of? Bike).to eq(true)
  end

  it "expects the bike to be working" do 
    bike = subject.docking_bike(Bike.new)
    expect(subject.release_bike.working?).to eq(true)
  end 
  
  it "responds to docking_bike" do
    bike = subject.docking_bike(Bike.new)
    expect(subject.docked_bikes.include? (bike)).to eq (true)
  end

  it "should not release bike if none are available" do 
    expect{ subject.release_bike }.to raise_error "No bikes available"
  end 
end



