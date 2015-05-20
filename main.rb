require 'pry'
require_relative 'building'
require_relative 'apartment'
require_relative 'tenant'
require_relative 'menu'



#intial set up of building-1 and 3 flats inside with tenants
building_one = Building.new name: 'GA tower', floors: 5, address: '1 The Avenue', floors: 10, num_of_apartments: 15, age: 100, concierge: true 

a1 = Apartment.new  price: 3000, occupied: false, balcony: true, sqft: 2700, bedrooms: 3, bathrooms: 2, flat_number: 1
a2 = Apartment.new price: 1000, occupied: false, balcony: false, sqft: 900, bedrooms: 1, bathrooms: 1, flat_number: 2
a3 = Apartment.new  price: 5000, occupied: true, balcony: true, sqft: 4700, bedrooms: 5, bathrooms: 3, flat_number: 3
[a1, a2, a3].each { |appt| building_one.apartments << appt }

t1 = Tenant.new name: 'Gui', age: 30, sex: 'male', apartment: a1
t2 = Tenant.new name: 'Her', age: 28, sex: 'female'
t3 = Tenant.new name: 'Cedric', age: 31, sex: 'male'
t4 = Tenant.new name: 'Clem', age: 28, sex: 'female'

a1.tenants << t1
a2.tenants << t2
a3.tenants << t3 << t4
# end initial setup building and flats


# later have def welcome ask which building it is for and return the building so menu_main uses as argument
menu_main(building_one)





binding.pry
nil