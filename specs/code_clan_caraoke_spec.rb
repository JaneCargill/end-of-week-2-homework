require('minitest/autorun')
require('minitest/rg')
require_relative('../code_clan_caraoke')
require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestCode_clan_caraoke < Minitest::Test

  def setup
    
    @guest1 = Guest.new(1, 100, "Angels")
    @guest2 = Guest.new(2, 5, "Yellow")
    @guest3 = Guest.new(3, 20, "My Way")
    @guest4 = Guest.new(4, 50, "Shake It Off")

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

    @room1 = Room.new(1, 20, songs)
    @room2 = Room.new(2, 10, songs)
    @room3 = Room.new(3, 15, songs)
    @room4 = Room.new(4, 2, songs)

    rooms = [@room1, @room2, @room3, @room4]

    @ccc = Code_clan_caraoke.new(10, rooms)
  end

  def test_number_of_rooms
    list_of_rooms = @ccc.rooms
    assert_equal(4, list_of_rooms.count)
  end

  def test_entry_fee
    assert_equal(10, @ccc.entry_fee)
  end

  def test_allow_entry_to_guest
    assert_equal(true, @ccc.guest_can_enter(@guest1, @room1))
  end

  def test_guest_reject_entry
    assert_equal(false, @ccc.guest_can_enter(@guest2, @room2))
  end

  def test_move_guest_to_room_number
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    assert_equal(4, @ccc.move_guest_to_room(@guest4, @room1))
  end

  def test_move_guest_to_room_number
      @room4.add_guest_to_room(@guest1)
      @room4.add_guest_to_room(@guest2)
      @room4.add_guest_to_room(@guest3)
      assert_equal(2, @ccc.move_guest_to_room(@guest4, @room4))
    end

end  