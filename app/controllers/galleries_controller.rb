class GalleriesController < ApplicationController
  def index
    @gallery = Gallery.all
  end
  def show
    @image = Gallery.find(params[:id])
  end
end
