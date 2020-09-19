class CreatePictureGalleryImages < ActiveRecord::Migration[6.0]
  def change
    create_table :picture_gallery_images do |t|
      t.references :picture_gallery, foreign_key: true
    end
  end
end
