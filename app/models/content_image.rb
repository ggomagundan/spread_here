class ContentImage < ActiveRecord::Base

  mount_uploader :image, MarketUploader

end
