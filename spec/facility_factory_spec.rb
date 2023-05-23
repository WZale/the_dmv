require "spec_helper"

RSpec.describe FacilityFactory do
  before(:each) do
    @oregon_facilities = FacilityFactory.new("Oregon", DmvDataService.new.or_dmv_office_locations)
    @new_york_facilities = FacilityFactory.new("New York", DmvDataService.new.ny_dmv_office_locations)

  end
  describe "#initialize" do
    it "exists" do
      expect(@oregon_facilities).to be_an_instance_of(FacilityFactory)
      expect(@oregon_facilities.state_dmv_locations).to be_an(Array)
      expect(@oregon_facilities.state_dmv_locations[0]).to be_a(Hash)
      expect(@oregon_facilities.state_dmv_locations[0][:title]).to be_a(String)
    end
  end

  describe "#create_facilities" do
    it "can create facilities in Oregon" do
      expect(@oregon_facilities.create_facilities).to be_an(Array)
      expect((@oregon_facilities.create_facilities)[0]).to be_an_instance_of(Facility)
      expect((@oregon_facilities.create_facilities)[0].name).to be_a(String)
    end
  end
  
  describe "#create_NY_facilities" do
    it "can create facilities for New York state" do
      ny_facilities = @new_york_facilities.create_facilities
      expect(ny_facilities).to be_an(Array)
      expect((ny_facilities)[0]).to be_an_instance_of(Facility)
      expect((ny_facilities)[0].name).to be_a(String)
    end
  end

  # helper method tests
  
  describe "#oregon_facility_creator" do
    it "can create facilities from Oregon" do
      # ???
    end
  end
  
  describe "#oregon_address_formatter" do
    it "can format DMV office addresses from Oregon" do
      # ???
    end
  end

  describe "#new_york_facility creator" do
    it "can create facilities from New York" do
      # ???
    end
  end

  describe "#new_york_address_formatter" do
    it "can format DMV office addresses from New York" do
      # ???
    end
  end

  describe "#new_york_phone_formatter" do
    it "can format phone numbers from New York" do
      # ???
    end
  end

end