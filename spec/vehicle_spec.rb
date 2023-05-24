require "spec_helper"

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: "123456789abcdefgh", year: 2012, make: "Chevrolet", model: "Cruz", engine: :ice} )
    @bolt = Vehicle.new({vin: "987654321abcdefgh", year: 2019, make: "Chevrolet", model: "Bolt", engine: :ev} )
    @camaro = Vehicle.new({vin: "1a2b3c4d5e6f", year: 1969, make: "Chevrolet", model: "Camaro", engine: :ice} )
  end
  describe "#initialize" do
    it "can initialize" do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq("123456789abcdefgh")
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq("Chevrolet")
      expect(@cruz.model).to eq("Cruz")
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe "#antique?" do
    it "can determine if a vehicle is an antique" do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      # You don't really need to test all three cars
      #every time. Think about the method and what needs
      # to be tested for the method. Here, we really
      #just need to make sure the true and false paths
      # are tested, so just testing two cars would suffice.
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe "#electric_vehicle?" do
    it "can determine if a vehicle is an ev" do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
    end
  end

  describe "issue_plate" do
    it "can issue plates" do
      expect(@cruz.issue_plate).to eq(:regular)
      expect(@camaro.issue_plate).to eq(:antique)
      expect(@bolt.issue_plate).to eq(:ev)
      #Here we WOULD want to test all three since we have
      # 3 different options in our flow control for this method.
    end
  end
end