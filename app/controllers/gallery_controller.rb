class GalleryController < ApplicationController
  before_action :set_picture_gallery, only: [:show, :add_image, :similar_images]

  def index
    @picture_gallery = PictureGallery.new
  end

  def show
    @gallery = @picture_gallery.picture_gallery_images.paginate(page: params[:page], per_page: 6)
  end

  def create
    @picture_gallery = PictureGallery.new(gallery_params)
    if @picture_gallery.save
      redirect_to gallery_path(@picture_gallery.id)
    else
      flash[:notice] = 'Щось пішло не так('
      redirect_to root_path
    end
  end

  def similar_images
    @pictures = PictureGalleryImage.find(params[:picture_id])
    @similar_images = @pictures.similar_images.paginate(page: params[:page], per_page: 5)
  end

  def add_image
    @picture_gallery.attach_images(gallery_params[:images])
    redirect_to gallery_path(params[:id])
  rescue StandardError
    flash[:alert] = 'Щось пішло не так('
    redirect_to gallery_path(params[:id])
  end

  def add_similar_images
    picture = PictureGalleryImage.find_by(picture_gallery_id: params[:id])

    if picture.attach_similar_images(gallery_params[:similar_images])
      redirect_to similar_images_gallery_path(id: params[:id], picture_id: picture.id)
    else
      flash[:alert] = picture.errors.messages.values.flatten.uniq
      redirect_to similar_images_gallery_path(id: params[:id], picture_id: picture.id)
    end
  end

  private

  def gallery_params
    params.fetch(:picture_gallery, {}).permit(:category,
                                              similar_images: [],
                                              images: [])
  end

  def set_picture_gallery
    @picture_gallery = PictureGallery.find(params[:id])
  end
end
