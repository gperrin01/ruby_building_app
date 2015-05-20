class Building

  attr_accessor :apartments, :floors, :address, :num_of_apartments, :age, :concierge, :name

  def initialize(options = {})
    # options is a hash which will hold the attributes - no need to worry about the order
    @name = options[:name]
    @floors = options[:floors]
    @address = options[:address]
    @num_of_apartments = options[:num_of_apartments]
    @age = options[:age]
    @concierge = options[:concierge]
    @apartments = options[:apartments] || []
  end

  def to_s
    "This is #{@name} on #{address}"
  end


end




# # why do we use Class and not hash?
# because a class is personalized, we pre-set some attributes (instance variable), and we can run dedicated functions on them
# but i could define the function and run it on the hash?