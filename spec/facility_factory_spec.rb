require "spec_helper"

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "exists" do
      or_facilities = FacilityFactory.new(DmvDataService.new.or_dmv_office_locations)

      expect(or_facilities).to be_an_instance_of(FacilityFactory)
      expect(or_facilities.state_dmv_locations).to be_an(Array)
      expect(or_facilities.state_dmv_locations[0]).to be_a(Hash)
      expect(or_facilities.state_dmv_locations[0][:title]).to be_a(String)
    end
  end

  describe "#create_facilities" do
    it "can create facilities" do
      or_facilities = FacilityFactory.new(DmvDataService.new.or_dmv_office_locations)
      
      expect(or_facilities.create_facilities).to be_an(Array)
      expect((or_facilities.create_facilities)[0]).to be_an_instance_of(Facility)
      expect((or_facilities.create_facilities)[0].name).to be_a(String)
      require 'pry'; binding.pry
    end
  end

end