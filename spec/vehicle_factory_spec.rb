require "spec_helper"

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "exists" do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
      
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(wa_ev_registrations).to be_an(Array)
      expect(wa_ev_registrations[0]).to be_a(Hash)
      expect(wa_ev_registrations[0][:electric_vehicle_type]).to be_a(String)
    end
  end
  
  describe "#create_vehicles" do
  it "can create vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
    expect(factory.create_vehicles(wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    expect(factory.create_vehicles(wa_ev_registrations)[0].engine).to eq(:ev)
    end
  end

end