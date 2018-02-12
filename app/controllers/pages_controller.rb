class PagesController < ApplicationController
  layout false

  def index
    redirect_to 'http://mfa.gov.kz/bishkek'
  end

  def show
    @page = Page.find(params[:id])
  end
end
