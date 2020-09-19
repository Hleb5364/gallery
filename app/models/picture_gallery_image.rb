class PictureGalleryImage < ApplicationRecord
  belongs_to :picture_gallery

  has_one_attached :image
end
