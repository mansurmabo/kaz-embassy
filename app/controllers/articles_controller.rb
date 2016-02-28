class ArticlesController < ApplicationController
  def index
    @types = Type.all
    @articles = Article.order(created_at: :desc)
  end

  def get_news
    @type = Type.find(params[:id])
    @articles = Article.where(type_id: @type)
  end

  def show
    @article = Article.find(params[:id])
  end
end
