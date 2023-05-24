class Registrant
    attr_reader :name, 
                :age,
                :permit,
                #we don't actually want this :permit reader here
                # our reader is technically the 'permit?' method
                # since we want it to have the question  mark at 
                #the end to indicate a boolean value.
                :license_data

  def initialize(name, age, permit = false)
    @name = name
    @age = age
    @permit = permit
    @license_data = {:written => false, :license => false, :renewed => false }
  end

  def permit?
    @permit
  end

  def earn_permit
    @permit = true
  end

# Should these methods have logic in them in order to prevent improperly qualified registrants from being able to pass their tests? Probably not, because they are only being called on qualified registrants.

  def pass_written_test
    @license_data[:written] = true
  end

  def pass_road_test
    @license_data[:license] = true
  end

  def renew_license
    @license_data[:renewed] = true
  end
  
end