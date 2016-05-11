require "instagram"

Instagram.configure do |config|

  if Rails.env == "development"
    #config.client_id = "f4a4dcf7e31d4be6823e08ffa0b44369"
    config.client_id = "4839364cec3442bcba1ed06501a4b416"
    config.client_secret = "e3c159073f82454092aa418ef9ecc76a"
    config.access_token = "1275394365.4839364.3f101be3990b4be6a39fbe87766f7100"
  else
    config.client_id = "4839364cec3442bcba1ed06501a4b416"
    config.access_token = "e3c159073f82454092aa418ef9ecc76a"
  end

end

