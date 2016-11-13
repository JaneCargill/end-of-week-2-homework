class Code_clan_caraoke

  attr_accessor :rooms, :entry_fee

  def initialize(entry_fee, rooms)
    @rooms = rooms
    @entry_fee = entry_fee
  end

  def guest_can_enter(guest, room)
    spaces_available = room.number_of_guests_in_room < room.capacity_of_room
    return (guest.money >= @entry_fee) && spaces_available
  end

  def move_guest_to_room(guest, room)
    room.add_guest_to_room(guest) if guest_can_enter(guest, room) 
    return room.number_of_guests_in_room
  end
end 