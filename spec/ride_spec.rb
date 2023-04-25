require './lib/ride'

RSpec.describe Ride do
  before(:each) do
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end
    it "can initialize with readable attributes" do
      expect(@ride1).to be_a(Ride)

      expect(@ride1.name).to eq("Walnut Creek Trail")
      expect(@ride1.distance).to eq(10.7)
      expect(@ride1.terrain).to eq(:hills)
    end
    
    it "has a loop? method" do
      expect(@ride1.loop?).to eq(false)
      expect(@ride2.loop?).to eq(true)
  end

    it "has a total_distance method" do
      expect(@ride1.total_distance).to eq(21.4)
      expect(@ride2.total_distance).to eq(14.9)
  end
end