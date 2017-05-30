class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @results
    else
      @results = Article.search(params[:q], page: params[:page], per_page: 20)
    end
  end
end
