class Bar

  def initialize()
    @drink_list = Hash.new()

  end

  def set_up_drinks_list(drink_list)
    for key, value in drink_list
      @drink_list[(key)] = value
    end
  end

  def get_price_of_drink(drink)
    return  @drink_list[drink]
  end


end
