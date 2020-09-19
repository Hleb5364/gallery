class PictureGallery < ApplicationRecord
  has_many :picture_gallery_images
  
  validates :category, presence: true, uniqueness: true
end
