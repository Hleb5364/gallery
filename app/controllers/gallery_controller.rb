class GalleryController < ApplicationController
  def index
    @picture_gallery = PictureGallery.new()
  end

  def show
    @picture_gallery = PictureGallery.find(params[:id])
  end

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
  end

  private

  def gallery_params
    params.fetch(:picture_gallery, {}).permit(:category)
  end
end 
