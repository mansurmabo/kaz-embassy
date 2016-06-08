class GalleriesController < ApplicationController
  def index
    @images = Gallery.order(created_at: :desc).page(params[:page]).per(12)
  end

  def show
    @image = Gallery.find(params[:id])
  end
  def get_category
    @images = Gallery.where(images_category_id: params[:id])
  end
end
