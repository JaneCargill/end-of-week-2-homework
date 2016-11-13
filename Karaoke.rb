require_relative 'code_clan_caraoke'
require_relative 'song'
require_relative 'room'
require_relative 'guest'
require_relative 'bar'
require_relative 'viewer'

class Karaoke

  def initialize(viewer)
    @viewer = viewer


     guest1_money = @viewer.get_guest_amount_of_money_to_spend(1)
     # guest2_money = @viewer.get_guest_amount_of_money_to_spend(2)
     # guest3_money = @viewer.get_guest_amount_of_money_to_spend(3)
     # guest4_money = @viewer.get_guest_amount_of_money_to_spend(4)

     guest1_fav_song = @viewer.get_guest_favourtite_song(1)
     # guest2_fav_song = @viewer.get_guest_favourtite_song(2)
     # guest3_fav_song = @viewer.get_guest_favourtite_song(3)
     # guest4_fav_song = @viewer.get_guest_favourtite_song(4)     


     @guest1 = Guest.new(1, guest1_money, guest1_fav_song)
     # @guest2 = Guest.new(2, guest2_money, guest2_fav_song)
     # @guest3 = Guest.new(3, guest3_money, guest3_fav_song)
     # @guest4 = Guest.new(4, guest4_money, guest4_fav_song)


     @song1 = Song.new("Sweet Caroline", "Neil Diamond")
     @song2 = Song.new("Don't Stop Believin'", "Journey")
     @song3 = Song.new("Bohemian Rhapsody", "Queen")
     @song4 = Song.new("Wonderwall", "Oasis")
     @song5 = Song.new("My Way", "Frank Sinatra")
     @song6 = Song.new("Losing My Religion", "R.E.M.")
     @song7 = Song.new("Angels", "Robbie Williams")
     @song8 = Song.new("Shake It Off", "Taylor Swift")
     @song9 = Song.new("Son of a Preacher Man", "Dusty Springfield")
     @song10 = Song.new("Eye of the Tiger", "Survivor")

     songs = [@song1, @song2, @song3, @song4, @song5, @song6, @song7, @song8, @song9, @song10]


     @room1 = Room.new(1, 2, songs)
     @room2 = Room.new(2, 3, songs)
     @room3 = Room.new(3, 4, songs)

     rooms = [@room1, @room2, @room3]

     @ccc = Code_clan_caraoke.new(10, rooms.count)

    @drinks_list = {vodka: 5,
               gin: 5,
               beer: 3,
               cider: 3,
               wine: 4,
               soft: 1
             }

    @bar = Bar.new()
  end

  def run
    @viewer.direct_guest_to_room(@ccc, @guest1, @room1)
    @viewer.welcome_guest_to_room(@guest1, @room1)
    @viewer.guest_to_sing(@room1)
  end

end

gamekaraoke = Karaoke.new(Viewer.new)
gamekaraoke.run()


