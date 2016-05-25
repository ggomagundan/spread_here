class ContentImage < ActiveRecord::Base

  mount_uploader :image, ContentUploader

end
