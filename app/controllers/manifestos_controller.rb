class ManifestosController < ApplicationController
  def index
    @manifestos = Manifesto.order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @manifesto = Manifesto.find(params[:id])
  end
end
