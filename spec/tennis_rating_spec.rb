require "spec_helper"

describe RacketLoggerUT do
  before :each do
    @rl = RacketLoggerUT.new(["7-5, 5-7, 6-2", "4-6, 1-6", "7-5, 6-2", "3-6, 6-4, 6-2", "6-4, 6-2", "6-1, 6-3", "6-2, 6-4"])
  end


  describe "#new" do
    it "take a single array and returns a RacketLoggerUT object" do
      expect(@rl).to be_an_instance_of RacketLoggerUT
    end
  end

  describe "#points" do
    it "returns an 2D array of points" do
      expect(@rl.points).to eql([[12, 8], [5, 14], [14, 7], [12, 8], [14, 6], [14, 4], [14, 6]])
    end
  end

  describe "#rating" do
    it "returns an float with presicsion 2" do
      expect(@rl.rating).to eql(4.57)
    end
  end
end
