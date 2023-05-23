require "dmv_data_service"

class FacilityFactory
  attr_reader :state_dmv_locations

  def initialize(state_dmv_locations)
    @state_dmv_locations = state_dmv_locations
  end

  def create_facilities
    @state_dmv_locations.map do |facility|
      Facility.new( {name: facility[:title], address: oregon_address_formatter(facility[:location_1][:human_address]), phone: facility[:phone_number]} )
    end
  end
  
  # helper methods
  def oregon_address_formatter(address)
    new_address = JSON.parse(address)
    new_address = "#{new_address["address"]}, #{new_address["city"]}, #{new_address["state"]}, #{new_address["zip"]}" 
  end

end



