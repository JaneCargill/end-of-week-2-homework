

class Guest

  attr_accessor :guest_ID, :money, :favourite_song

  def initialize(guest_ID, money, favourite_song)
    @guest_ID = guest_ID
    @money = money
    @favourite_song = favourite_song
  end

  def can_afford_entry(caraoke)
     new_money_amount = (@money - caraoke.entry_fee) if @money > caraoke.entry_fee 
     @money = new_money_amount
  end

  def can_buy_drink(drink)
    if @money >= drink 
      new_money_amount = @money - drink 
    else
      new_money_amount = @money
    end
    return @money = new_money_amount
  end

  def choose_song(song)
    song == song.name || song.artist
    return song.name
  end

 


end