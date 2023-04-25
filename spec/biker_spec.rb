require './lib/ride'
require './lib/biker'

RSpec.describe Ride do
  before(:each) do
    @biker = Biker.new("Kenny", 30)
    @biker2 = Biker.new("Athena", 15)

    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  it "can initialize with readable attributes" do
    expect(@biker.name).to eq("Kenny")
    expect(@biker.max_distance).to eq(30)
    expect(@biker.rides).to eq({})
    expect(@biker.acceptable_terrain).to eq([])
  end

  it "has a learn_terrain! method" do
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)

    expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
  end

  it "has a log_ride method" do
    @biker.learn_terrain!(:gravel)
    @biker.learn_terrain!(:hills)
    
    @biker.log_ride(@ride1, 92.5)
    @biker.log_ride(@ride1, 91.1)
    @biker.log_ride(@ride2, 60.9)
    @biker.log_ride(@ride2, 61.6)

    expected =  {
                @ride1 => [92.5, 91.1],
                @ride2 => [60.9, 61.6]
                }

    expect(@biker.rides).to eq(expected)
  end

end