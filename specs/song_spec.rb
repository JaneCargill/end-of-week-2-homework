require('minitest/autorun')
require('minitest/rg')
require_relative('../song')

class TestSong < Minitest::Test

  def setup
    @song = Song.new("Angels", "Robbie Williams")
  end

  def test_find_song_by_song_name
    assert_equal("Angels", @song.name)
  end

  def test_find_song_by_artist
    assert_equal("Robbie Williams", @song.artist)
    binding.pry
  end

end
