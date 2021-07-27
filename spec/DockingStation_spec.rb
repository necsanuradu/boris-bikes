describe "DockingStation" do
  it "it would have to release a bike" do
    expect(DockingStation.release_bike).to eq(true)
  end
end