class PictureGallery < ApplicationRecord
  has_many :picture_gallery_images

  validates :category, presence: true, uniqueness: true

  def attach_images(images)
    images.each do |img|
      picture = PictureGalleryImage.new(picture_gallery_id: id)
      picture.image.attach(img)
      picture.save
    end
  end
end
