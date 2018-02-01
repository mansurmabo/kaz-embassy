class SearchController < ApplicationController
  def search
    if params[:q].present?
      @results = Article.search_by_title_content(params[:q])
    else
      @results
    end
  end
end
