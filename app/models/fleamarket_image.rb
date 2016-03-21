class FleamarketImage < ActiveRecord::Base

=begin
  include Mongoid::Document
  include Mongoid::Timestamps
=end

  belongs_to :flea_market#, inverse_of: :fleamarket_images


=begin
  field :flea_market_id, type: String
  field :image, type: String
  field :image_type, type: Integer, default: 0
  field :sort, type: Integer

=end

  mount_uploader :image, MarketUploader


end
