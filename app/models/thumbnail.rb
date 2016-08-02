class Thumbnail < ActiveRecord::Base
  belongs_to :project
  enum status: { mein: 0, sub: 1 }

  mount_uploader :image_url, ImageUploader
end
