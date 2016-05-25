CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJWKBJUBMPG6XAY7Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
    #host:                  's3.example.com',             # optional, defaults to nil
    #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'spreadhere' if Rails.env.production?                         # required
  config.fog_directory  = 'spreadheredev' if !Rails.env.production?                          # required
  config.fog_public     = true # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
