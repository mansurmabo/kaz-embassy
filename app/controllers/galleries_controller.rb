class GalleriesController < ApplicationController
  def index
    # @gallery = Gallery.all
    @category = ImagesCategory.all
    @images = Gallery.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @image = Gallery.find(params[:id])
  end
  def get_category
    @images = Gallery.where(imagescategory_id: params[:id])
  end
end
