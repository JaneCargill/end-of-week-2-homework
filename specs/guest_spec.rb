require('minitest/autorun')
require('minitest/rg')
require_relative('../guest')
require_relative('../code_clan_caraoke')
require_relative('../song')
require_relative('../bar')

class TestGuest < Minitest::Test

  def setup
  @guest = Guest.new(1, 100, "Angels")
  @guest2 = Guest.new(2, 17, "Sweet Caroline")
  @ccc = Code_clan_caraoke.new(10, 4)

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

 @drinks_list = {vodka: 5,
            gin: 5,
            beer: 3,
            cider: 3,
            wine: 4,
            soft: 1
          }

 @bar = Bar.new()

  end

  def test_guest_ID
    assert_equal(1, @guest.guest_ID)
  end  

  def test_guest_amount_of_money
    assert_equal(100, @guest.money)
  end

  def test_guest_favourite_song
    assert_equal("Angels", @guest.favourite_song)
  end 

  def test_guest_can_afford_entry
    assert_equal(90, @guest.can_afford_entry(@ccc))
  end 

  def test_guest_can_buy_drink
    @bar.set_up_drinks_list(@drinks_list)
    drink = @bar.get_price_of_drink(:gin)
    @guest.can_buy_drink(drink)
    assert_equal(90, @guest.can_buy_drink(drink))
  end 

  def test_guest_cannot_buy_drink
    @guest2.can_afford_entry(@ccc)
    @bar.set_up_drinks_list(@drinks_list)
    drink = @bar.get_price_of_drink(:gin)
    @guest2.can_buy_drink(drink)
    assert_equal(2, @guest2.can_buy_drink(drink))
  end 

  def test_guest_can_choose_song
    assert_equal("Wonderwall", @guest.choose_song(@song4))
  end

  # def test_reaction_to_favourite_song
  #   assert_equal("I love this song", @guest.reaction_to_favourite_song(@song7))
  # end

  end