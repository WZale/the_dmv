require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new("Bruce", 18, true )
    @registrant_2 = Registrant.new("Penny", 15 )
  end

  describe "#initialize" do
    it "can initialize with readable attributes" do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      
      expect(@registrant_2.name).to eq("Penny")
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    
    describe "#permit?" do
      it "has a permit? method" do
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_2.permit?).to eq(false)
      end
    end

    describe "#earn_permit" do
      it "has an earn_permit method" do
        @registrant_2.earn_permit
        expect(@registrant_2.permit?).to eq(true)
      end
    end

  
    describe "#pass_written_test" do
      it "has a pass written test method" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @registrant_1.pass_written_test
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
      end
    end
    
    describe "#pass_road_test" do
      it "has a pass road test method" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @registrant_1.pass_written_test
        @registrant_1.pass_road_test
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
      end
    end
    
    describe "#renew_license" do
      it "has a renew license method" do
        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        @registrant_1.pass_written_test
        @registrant_1.pass_road_test
        @registrant_1.renew_license
        expect(@registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
      end
    end
  end
end