require 'vehicle'

class VehicleFactory
  def initialize; end
  #If nothing is in the initialize, you actually
  # don't need to put it at all! :) 

  def create_vehicles(registrations)
    registrations.map do |registration|
      Vehicle.new({ vin: registration[:vin_1_10],
                    year: registration[:model_year],
                    make: registration[:make],
                    model: registration[:model],
                    engine: :ev })
                    #Awesome, great job here! 
    end
  end
end
