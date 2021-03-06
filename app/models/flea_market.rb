class FleaMarket < ActiveRecord::Base

  searchkick
=begin
  include Mongoid::Document
  include Mongoid::Timestamps
=end

  has_many :fleamarket_images#, inverse_of: :flea_market
  has_many :fleamarket_tags

  belongs_to :city

  default_scope{ order("flea_markets.priority desc, flea_markets.id desc") }

  mount_uploader :list_image, MarketUploader
  mount_uploader :top_image, MarketUploader

  accepts_nested_attributes_for :fleamarket_images, :fleamarket_tags,
    allow_destroy: true

  after_create do |fm|
    fm.fleamarket_tags.new(tag_name: "플리마켓")
    fm.fleamarket_tags.new(tag_name: "spreadhere")
    fm.fleamarket_tags.new(tag_name: fm.city.name) if fm.city_id.present?
    fm.save

    if fm.content_images.present?
      fm.top_image = fm.content_images.first.image if fm.top_image.blank?
      fm.list_image = fm.content_images.first.image if fm.list_image.blank?
      fm.save
    end
  end

=begin
  field :is_visible, type: Integer, default: 1
  field :market_name, type: String
  field :start_date, type: DateTime
  field :end_date, type: DateTime
  field :location, type: String
  field :memo, type: String
  
  #http://www.rubygeocoder.com/
  field :latitude, type: Float
  field :longitude, type: Float
=end

  #UserInfo

  #scope :searchable, -> { where(is_visible: 1).and(:end_date.gte => Time.now, :start_date.lte => Time.now) }
  scope :searchable, -> { where(is_visible: 1).where("flea_markets.end_date >= ?", Time.now) }
  scope :searchable_end_order, -> { where(is_visible: 1).where("flea_markets.end_date >= ?", Time.now).reorder("flea_markets.end_date asc") }
  scope :non_searchable, -> { where(is_visible: 1).where("flea_markets.end_date <= ?", Time.now)}
  scope :admin_list, -> {reorder("flea_markets.id desc") }

  def is_visible?

    self.end_date.present? && self.is_visible == 1 && self.end_date >= Time.now
  end

  def is_visible_str
    if self.is_visible?
      "O"
    elsif self.is_visible == 2
      "심사"
    else
      "X"
    end
  end

  def have_location?
    self.latitude.present? &&  self.longitude.present? \
    && self.latitude > 0 && self.longitude > 0
  end

  def pick_recommend(len)
    FleaMarket.searchable.where.not(id: self.id).sample(len)
  end
=begin
  def top_image
    self.fleamarket_images.where(is_visible: 1, image_type: 0).first


    FleaMarket.all.each do |fm|
    fm.top_image = fm.fleamarket_images.where(is_visible: 1, image_type: 0).first.image
    fm.list_image = fm.fleamarket_images.where(is_visible: 1, image_type: 0).first.image
    fm.save

end

  end
=end

  def content_images
    self.fleamarket_images.where(is_visible: 1).order("sort asc")
  end

  def content_tags
    self.fleamarket_tags.where(is_visible: 1)
  end

end
