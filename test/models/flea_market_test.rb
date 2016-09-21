require 'test_helper'

class FleaMarketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_valid_flea_market
    flea_market = FleaMarket.new(is_visible: 1, market_name: "MarketName",\
                                     start_date: Time.parse("2015-01-01 00:01:02"), end_date: Time.parse("2020-12-30 23:38:23"),\
                                     top_text: "this is top Text", bottom_text: "this is bottom Text",\
                                     location: "Test Location", memo: "Test Memo", latitude: 37.565600, longitude: 126.977983 , city_id: 1)
    assert flea_market.valid?

  end
end
