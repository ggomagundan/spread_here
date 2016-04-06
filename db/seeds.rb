# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  flea_market = FleaMarket.create(is_visible: 1, market_name: "MarketName",\
                                  start_date: Time.parse("2015-01-01 00:01:02"), end_date: Time.parse("2020-12-30 23:38:23"),\
                                  location: "Test Location", memo: "Test Memo", latitude: 37.565600, longitude: 126.977983 )

  flea_market.remote_top_image_url = "http://img.yaplog.jp/img/17/pc/y/a/m/yamu98/26/26332.jpg"
  flea_market.remote_list_image_url = "http://img.yaplog.jp/img/17/pc/y/a/m/yamu98/26/26332.jpg"
  flea_market.save

  img = flea_market.fleamarket_images.new
  img.remote_image_url = "http://img.yaplog.jp/img/17/pc/y/a/m/yamu98/26/26332.jpg"
  img.save

  tags = flea_market.fleamarket_tags.create(tag_name: "fleamarket")
  tags = flea_market.fleamarket_tags.create(tag_name: "sharing")
  tags = flea_market.fleamarket_tags.create(tag_name: "spreadhere")



