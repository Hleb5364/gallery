class PictureGalleryImage < ApplicationRecord
  belongs_to :picture_gallery

  has_one_attached :image
  has_many_attached :similar_images
end
