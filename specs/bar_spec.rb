require('minitest/autorun')
require('minitest/rg')
require_relative('../bar')

class TestBar < Minitest::Test

  def setup

   @drinks_list = {vodka: 5,
              gin: 5,
              beer: 3,
              cider: 3,
              wine: 4,
              soft: 1
            }

   @bar = Bar.new()
   
  end  

def test_get_price_of_drink 
  @bar.set_up_drinks_list(@drinks_list) 
  assert_equal(5, @bar.get_price_of_drink(:vodka))
  assert_equal(1, @bar.get_price_of_drink(:soft))
  assert_equal(3, @bar.get_price_of_drink(:beer))
  assert_equal(4, @bar.get_price_of_drink(:wine))
end


end