class PictureGallery < ApplicationRecord
  validates :category, presence: true, uniqueness: true
end
