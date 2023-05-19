require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      vehicle.issue_plate
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.engine == :ev
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      @registered_vehicles << vehicle
    else
      nil
    end
  end

end