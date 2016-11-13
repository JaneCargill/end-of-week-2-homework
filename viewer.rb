class Viewer

  def get_guest_amount_of_money_to_spend(guest)
    puts "Guest #{guest} enter amount of money to spend:"
    return gets.chomp
  end

  def get_guest_favourtite_song(guest)
    puts "Guest #{guest}'s favourite song:"
    return gets.chomp
  end

  def direct_guest_to_room(ccc, guest, room)
    puts "Guest #{guest}, please go to room number #{room}" if ccc.guest_can_enter(guest, room)
  end

  def welcome_guest_to_room(guest, room)
    puts "Welcome Guest #{guest.guest_ID}" if room.add_guest_to_room(guest)
  end

  def guest_to_sing(room)
    room.guest_to_sing puts "#{room.singer} choose a song sing:"
    return gets.chomp
  end

  def guests_chosen_song(guest, song)
    puts "Great song choice. Playing #{guest.choose_song(song)}"
  end

  def reaction_to_favourite_song(guest, song)
    puts "I love this song" if guest.choose_song(song) == @favourite_song 
  end

  def room_at_maximum_capacity(room)
    puts "room #{room.room_number} is at maximum capacity" if room.number_of_guests_in_room >= room.capacity_of_room
  end

  def buying_a_drink(bar)
    puts "What would you like to drink?"
    return gets.chomp
    drink = ":" + gets.chomp
    price = bar.get_price_of_drink(drink)
    puts "That will be #{price}, please"
  end


end