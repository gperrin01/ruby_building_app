def menu
  puts `clear`
  puts "*** Hello Owner, what area are we working on today? ***"
  print "Manage (B)uilding or (A)partment, or (q)uit"
  choice = gets.chomp.downcase
  # add stuff for quit
  case choice
  when 'b'
    menu_building
  when 'a'
    menu_apartments
  when 'q'
    return
  end
end

def menu_apartments
  puts "*** Manage Apartments ***"
  print "(C)reate an apartment, (R)egister new tenant, (A)dd tenant to a apartment, or back (u)p in the menu or (q)uit?: "
  case choice
  when 'c'
    create_flat
  when 'r'
    register_tenant
  when 'a'
    add_tenant
  when 'u'
    menu
  when 'q'
    return
  end
end

def create_flat
  options = {}
  print "Price: "
  options[:price] = gets.to_f
end
