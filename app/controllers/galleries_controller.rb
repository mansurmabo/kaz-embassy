class GalleriesController < ApplicationController
  def index
    @gallery = Gallery.all
  end
end
