require "dmv_data_service"

class FacilityFactory
  attr_reader :state_dmv_locations

  def initialize(state_dmv_locations)
    @state_dmv_locations = state_dmv_locations
  end

  def create_facilities
    require 'pry'; binding.pry
  end
end