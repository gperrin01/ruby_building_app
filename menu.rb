def menu
  puts `clear`
  puts "*** Hello Owner, what area are we working on today? ***"
  print "Manage (B)uilding or (F)lats, or (q)uit"
  choice = gets.chomp.downcase
  case choce
  when 'b'
    menu_building
  when 'f'
    menu_flats
  end
end

def menu_flats
  puts "*** Manage Flats ***"
  print "(C)reate a flat, (R)egister new tenant, (A)dd tenant to a flat, or (q)uit?: "