class FacilityFactory
  attr_reader :name,
              :state_dmv_locations

  def initialize(name, state_dmv_locations)
    @name = name
    @state_dmv_locations = state_dmv_locations
  end

  def create_facilities
    if  self.name == "Oregon"
      orgeon_facility_creator
    elsif self.name == "New York"
      new_york_facility_creator
    end
  end
  
  # helper methods

  def orgeon_facility_creator
    @state_dmv_locations.map do |facility|
      Facility.new({
                    name: facility[:title], 
                    address: oregon_address_formatter(facility[:location_1][:human_address]),
                    phone: facility[:phone_number]
                    })
      end
  end

  def oregon_address_formatter(address)
    new_address = JSON.parse(address)
    new_address = "#{new_address["address"]}, #{new_address["city"]}, #{new_address["state"]}, #{new_address["zip"]}" 
  end

  def new_york_facility_creator
    @state_dmv_locations.map do |facility|
      Facility.new({
                    name: facility[:office_name], 
                    address: new_york_address_formatter(facility),
                    phone: new_york_phone_formatter(facility)
                    })
      end
  end

  def new_york_address_formatter(facility)
    new_address = facility
    new_address = new_address[:street_address_line_1] + ", " + new_address[:city] + ", " + new_address[:state] + ", " + new_address[:zip_code] 
  end
  
  def new_york_phone_formatter(facility)
    if facility[:public_phone_number] == nil
      "phone number unavailable"
    else
      unformatted = facility[:public_phone_number]
      formatted = unformatted.insert(3, '-').insert(7, '-')
    end
  end

end



