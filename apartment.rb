class Apartment

  attr_accessor :tenants, :flat_number, :price, :occupied, :renovation

  def initialize(options = {})
    @flat_number = options[:flat_number] || nil
    @price = options[:price]
    @occupied = options[:occupied]
    @balcony = options[:balcony]
    @sqft = options[:sqft]
    @bedrooms = options[:bedrooms]
    @bathrooms = options[:bathrooms]
    @tenants = options[:tenants] || []
    @renovation = options[:renovation] || false
  end 

  def is_occupied?
    @occupied
  end

  def ok_extra_tenant?
    # max 3 tenants per bedroom, so current number +1 <= 3xbedrooms
    @tenants.length < 3*@bedrooms
  end

end
