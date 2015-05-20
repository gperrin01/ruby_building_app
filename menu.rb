def menu_main(building)
  puts `clear`
  puts "*** Hello Owner, what area are we working on today? ***"
  puts building
  print "Manage (B)uildings or (A)partments, or (q)uit: "
  choice = gets.chomp.downcase
  # later add "Which building is it for?: "
  # add stuff for quit
  case choice
  when 'b'
    menu_buildings(building)
  when 'a'
    menu_apartments(building)
  when 'q'
    return
  end
  menu_main(building)
end

def menu_apartments(building)
  puts "*** Manage Apartments ***"
  print "(C)reate an apartment, (R)egister new tenant, (A)dd tenant to a apartment, Manage (Ren)ovations, or back (u)p in the menu or (q)uit?: "
  choice = gets.chomp.downcase
  case choice
  when 'c'
    create_flat(building)
  when 'r'
    add_tenant(building)
  when 'a'
    add_tenant(building)
  when 'ren'
    manage_renov(building)
  when 'u'
    menu_main(building)
  when 'q'
    return
  end
  menu_apartments(building)
end

def create_flat(building)
  # this is hardcoding building_one as the recipiet
  # can we streamline this using like a create_option(*array) // prob not cause questions differ
  options = {}
  print "Price in £: "
  options[:price] = gets.to_f  
  print "Square footage in sqft: "
  options[:sqft] = gets.to_f
  print "Number of bedrooms: "
  options[:bedrooms] = gets.to_f
  print "Number of bathrooms: "
  options[:bathrooms] = gets.to_f
  print "Is there a Balcony? Y/N: "
  options[:balcony] = gets.chomp.downcase == 'y' ? true : false
  print "Is it currently Occupied? Y/N: "
  options[:occupied] = gets.chomp.downcase == 'y' ? true : false  
  options[:flat_number] = building.apartments.length + 1
  appt = Apartment.new(options)
  building.apartments << appt
  puts "You added flat #{appt.flat_number} to #{building.name}"
end

def add_tenant(building)
  print "What flat to add the tenant to? Choose from flat 1 to flat #{building.apartments.length}: "
  i = gets.to_f-1
  flat = building.apartments[i]

  if flat.ok_extra_tenant? && !flat.renovation
    options = {}
    print "Tenant name: "
    options[:name] = gets.chomp  
    print "Tenant age: "
    options[:age] = gets.to_f
    print "Tenant gender M/F: "
    options[:sex] = gets.chomp.downcase == 'm' ? 'male' : 'female'
    tenant = Tenant.new(options)
    flat.tenants << tenant
    puts "You added #{tenant.name} to flat #{i} in #{building.name}"
  elsif flat.renovation
    puts "Sorry, flat under renovation at the moment"
  else puts "Sorry, too many tenants already in this flat"
  end
  # I cheated and added the tenant to the flat imemdiately
  # wthout the flat, wouldnt know how to save tenant anywhere??
end

def manage_renov(building)
  puts "For which flat to manage renovation? Choose from flat 1 to flat #{building.apartments.length}"
  flat = building.apartments[gets.to_f - 1]
  puts "The flat is #{flat.renovation ? 'under' : 'NOT under'} renovation, do you wish to change the status? Y/N: "
  if gets.chomp.downcase == 'y'
      flat.renovation = !flat.renovation 
      puts "Status changed"
  else puts "Sure, nothing changed"
  end

  flat.tenants = [] if !flat.renovation 
end

def menu_buildings(building)
  puts "*** Manage buildings ***"
  print "(E)vict all tenats, (L)ist the names of all tenants, Display total rental (Inc)ome, Display (V)acant vs Occupied flats, or back (u)p in the menu or (q)uit?: "
  choice = gets.chomp.downcase
  case choice
  when 'e'
    building.evict
  when 'l'
    building.list_tenants
  when 'a'
 
  when 'ren'
    
  when 'u'
    menu_main(building)
  when 'q'
    return
  end
  menu_buildings(building)
end






