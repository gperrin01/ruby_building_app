class Tenant

  attr_accessor :apartment, :name, :age, :sex

  def initialize(options = {})
    # options is a hash which will hold the attributes - no need to worry about the order
    @name = options[:name]
    @age = options[:age]
    @sex = options[:sex]
    @apartment = options[:apartment] || nil
  end


end