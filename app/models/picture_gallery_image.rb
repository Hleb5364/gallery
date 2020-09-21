class PictureGalleryImage < ApplicationRecord
  belongs_to :picture_gallery

  has_one_attached :image
  has_many_attached :similar_images

  validates :image, presence: true

  def attach_similar_images(images)
    begin
      check_format(images)
      check_size(images)
    rescue
      errors.add(:similar_images, "Ви не прикріпили зображення")
    end

    unless errors.messages.present?
      similar_images.attach(images)
    else
      false
    end
  end

  private

  def check_size(images)
    original_image = MiniMagick::Image.open(image)
    images.each do |img|
      similar_image = MiniMagick::Image.open(img.tempfile.to_path)
      unless original_image.width == similar_image.width && original_image.height == similar_image.height
        errors.add(:similar_images, "Формат зображень має бути #{original_image[:width]}x#{original_image[:height]}")
      end
    end
  end

  def check_format(images)
    images.each do |img|
      image_file = MiniMagick::Image.open(img.tempfile.to_path)
      unless image_file.type.downcase == image.filename.extension
        errors.add(:similar_images, "Формат зображень має бути #{image.filename.extension}")
      end
    end
  end
end
