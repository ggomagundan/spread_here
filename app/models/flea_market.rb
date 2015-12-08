class FleaMarket

  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :fleamarket_images, inverse_of: :flea_market

  field :is_visible, type: Integer, default: 1
  field :market_name, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :location, type: String
  field :memo, type: String
  
  #http://www.rubygeocoder.com/
  field :latitude, type: Float
  field :longitude, type: Float

  #UserInfo

  scope :searchable, -> { where(is_visible: 1).and(:end_date.gte => Time.now, :start_date.lte => Time.now) }

  def have_location?
    self.latitude.present? &&  self.longitude.present?
  end

  def top_image
    self.fleamarket_images.where(image_type: 0).first
  end

  def content_images
    self.fleamarket_images.where(image_type: 1).order("sort asc")
  end


end
