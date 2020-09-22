class PictureGalleryImage < ApplicationRecord
  belongs_to :picture_gallery

  has_one_attached :image
  has_many_attached :similar_images

  validates :image, presence: true

  def attach_similar_images(images)
    begin
      compare_images(images)
    rescue StandardError
      errors.add(:similar_images, 'Ви не прикріпили зображення')
    end

    if errors.messages.present?
      false
    else
      similar_images.attach(images)
    end
  end

  private

  def compare_images(images)
    original_image = MiniMagick::Image.open(image)
    images.each do |img|
      similar_image = MiniMagick::Image.open(img.tempfile.to_path)
      check_format(similar_image, original_image)
      check_size(similar_image, original_image)
    end
  end

  def check_size(similar_image, original_image)
    unless compareWidth(similar_image.width, original_image.width) && compareHeight(similar_image.height, original_image.height)
      errors.add(:similar_images, "Формат зображень має бути #{original_image[:width]}x#{original_image[:height]}")
    end
  end

  def compareWidth(similarImgWidth, originalImgWidth)
    (originalImgWidth * 1.1) >= similarImgWidth && (originalImgWidth * 0.9) <= similarImgWidth
  end

  def compareHeight(similarImgHeight, originalImgHeight)
    (originalImgHeight * 1.1) >= similarImgHeight && (originalImgHeight * 0.9) <= similarImgHeight
  end

  def check_format(similar_image, original_image)
    unless similar_image.type== original_image.type
      errors.add(:similar_images, "Формат зображень має бути #{image.filename.extension}")
    end
  end
end
