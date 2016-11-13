require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRooms < Minitest::Test

  def setup
    
    @guest1 = Guest.new(001, 50, "Angels")
    @guest2 = Guest.new(002, 10, "Shake it off")
    @guest3 = Guest.new(003, 80, "Wonderwall")

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

    @room1 = Room.new(1, 1, songs)
    @room2 = Room.new(2, 10, songs)
  end

  def test_room_number
    assert_equal(1, @room1.room_number)
  end

  def test_capacity_of_room
    assert_equal(1, @room1.capacity_of_room)
  end

  def test_add_guest_to_room
    assert_equal(1, @room1.add_guest_to_room(@guest1))
  end

  def test_reject_guest_from_room
    @room1.add_guest_to_room(@guest2)
    assert_equal(1, @room1.add_guest_to_room(@guest1))
  end

  def test_num_of_guests_in_room
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest2)
    assert_equal(2, @room2.number_of_guests_in_room())
  end

  def test_cannot_add_duplicate_guest
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest2)
    @room2.add_guest_to_room(@guest2)
    assert_equal(2, @room2.number_of_guests_in_room())
  end

  def test_which_guest_to_sing
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest2)
    @room2.add_guest_to_room(@guest3)
    @room2.guest_to_sing
    @room2.guest_to_sing
    assert_equal(003, @room2.singer.guest_ID)
  end

  def test_guest_to_leave_room
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest2)
    @room2.add_guest_to_room(@guest3)
    @room2.guest_to_leave_room(@guest2)
    assert_equal(2, @room2.number_of_guests_in_room)
  end

  def test_current_song_playing_in_room
    @room2.add_guest_to_room(@guest1)
    @room2.add_guest_to_room(@guest2)
    @room2.add_guest_to_room(@guest3)
    @room2.guest_to_sing
    assert_equal("Eye of the Tiger", @guest2.choose_song(@song10))
  end



end