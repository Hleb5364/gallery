class PictureGalleryImage < ApplicationRecord
  belongs_to :picture_galleries

  has_one_attached :image
end