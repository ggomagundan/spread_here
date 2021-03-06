require 'test_helper'

class FleaMarketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def flea_market_item
    flea_market = FleaMarket.new(is_visible: 1, market_name: "MarketName",\
                                     start_date: Time.parse("2015-01-01 00:01:02"), end_date: Time.parse("2020-12-30 23:38:23"),\
                                     top_text: "this is top Text", bottom_text: "this is bottom Text",\
                                     location: "Test Location", memo: "Test Memo", latitude: 37.565600, longitude: 126.977983 , city_id: 1)
  end

  def test_valid_flea_market
    flea_market = flea_market_item
    assert flea_market.valid?

  end

  def test_is_show_flea_market
    flea_market = flea_market_item
    assert_equal flea_market.is_visible, 1
  end

  test "should report error" do
  #  some_undefined_variable is not defined elsewhere in the test case
    assert true
  end

end
