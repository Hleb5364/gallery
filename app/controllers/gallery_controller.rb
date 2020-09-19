class GalleryController < ApplicationController
  before_action :set_picture_gallery, only: [:show, :add_image]
  def index
    @picture_gallery = PictureGallery.new()
  end

  def show; end

  def create
    @picture_gallery = PictureGallery.new(gallery_params)

    if @picture_gallery.save
      redirect_to gallery_path(id: @picture_gallery.id)
    else
      flash[:alert] = @picture_gallery.errors.messages.values.flatten
      redirect_to root_path
    end
  end

  def add_image
    binding.pry
    picture = PictureGalleryImage.new(picture_gallery_id: @picture_gallery.id)
    picture.image.attach(gallery_params[:image])
    binding.pry
    if picture.save
      binding.pry
      redirect_to gallery_path(params[:id])
    else
      flash[:alert] = "Щось пішло не так("
      redirect_to gallery_path(params[:id])
    end
  end

  private

  def gallery_params
    params.fetch(:picture_gallery, {}).permit(:id,
                                              :category,
                                              :image)
  end

  def set_picture_gallery
    @picture_gallery = PictureGallery.find(params[:id])
  end
end 
