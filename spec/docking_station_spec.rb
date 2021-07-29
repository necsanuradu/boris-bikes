require "./lib/docking_station.rb"
# subject(:diary_printer) { described_class.new(diary, output) }
describe DockingStation do
  it "responds to release_bike" do 
    expect(subject).to respond_to :release_bike
  end

  it "it gets a bike" do 
    subject.docking_bike(Bike.new)
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it "expects the bike to be working" do 
    subject.docking_bike(Bike.new)
    expect(subject.release_bike.working?).to eq(true)
  end 
  
  it "responds to docking_bike" do
    # bike = subject.docking_bike(Bike.new)
    # expect(subject.docked_bikes.include? (bike)).to eq (true)
    expect(subject.docking_bike(Bike.new).in?(subject.docked_bikes)).to eq(true)
  end

  it "should not release bike if none are available" do 
    expect{ subject.release_bike }.to raise_error "No bikes available"
  end 

  it "it raises an error if dock is full" do
    subject.docking_bike(Bike.new)
    expect{ subject.docking_bike(Bike.new) }.to raise_error "Dock is full"
  end
end



