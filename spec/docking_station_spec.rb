require "./lib/docking_station.rb"
# subject(:diary_printer) { described_class.new(diary, output) }
describe DockingStation do

  # $in_spec_test = true
  subject(:dock_with_set_capacity){ described_class.new(30) }
  subject(:dock_with_default_capacity){ described_class.new }
  let(:bike) { double :bike }
    # let's superpower our double
    # using allow().to receive().and_return()
    # allow(bike).to receive(:working?).and_return(true)


  it "responds to release_bike" do 
    expect(subject).to respond_to :release_bike
  end

  it "it gets a bike" do 
    bike_here = Bike.new
    allow(bike_here).to receive(:dock_bike_working?).and_return(true)
    subject.dock(bike_here)
    expect(subject.release_bike).to be_instance_of(Bike)
  end

  it "expects the bike to be working" do 
    allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:dock_bike_working?).and_return(true)
    subject.dock(bike)
    expect(subject.release_bike.working?).to eq(true)
  end 
  
  it "responds to dock" do
    allow(bike).to receive(:dock_bike_working?).and_return(true)
    expect(subject.dock(bike).in?(subject.working_bikes)).to eq(true)
  end

  it "should not release bike if none are available" do 
    expect{ subject.release_bike }.to raise_error "Not enough working bikes available"
  end 

  it "it raises an error if dock is full" do
    allow(bike).to receive(:dock_bike_working?).and_return(true)
    dock_with_default_capacity.capacity.times{ subject.dock(bike) }
    expect{ subject.dock(bike) }.to raise_error "Not enough spaces available"
  end

  it "allows a capacity variable to be set with the initialize method" do
    expect(dock_with_set_capacity.capacity).to eq(30)
  end

  it "check the default capacity to be equal to 20" do 
    expect(dock_with_default_capacity.capacity).to eq(20)
  end

end



