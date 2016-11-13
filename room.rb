class Room

  attr_accessor :room_number, :capacity_of_room, :singer

  def initialize(room_number, capacity_of_room, songs)
    @room_number = room_number
    @capacity_of_room = capacity_of_room
    @guests = []
    @songs = songs
    @singer = @guests[0]
  end


  def add_guest_to_room(guest)
      @guests << guest unless @guests.length >= @capacity_of_room
      @guests.length
    end

    def number_of_guests_in_room
      return @guests.uniq.length
    end

    def guest_to_sing
      @singer = @guests.rotate![0]
    end

    def guest_to_leave_room(guest)
      @guests.delete(guest)
    end


end


