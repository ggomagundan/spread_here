class FleamarketImage

  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :flea_market, inverse_of: :fleamarket_images


  field :flea_market_id, type: String
  field :image, type: String
  field :image_type, type: Integer, default: 0
  field :sort, type: Integer

  mount_uploader :image, MarketUploader


end
