class CreatePictureGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :picture_galleries do |t|
      t.string :category
      
      t.timestamps
    end
  end
end
