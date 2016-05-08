class ArticlesController < ApplicationController
  def index
    @types = Type.all
    @articles = Article.order(created_at: :desc).page(params[:page]).per(20)
  end

  def get_news
    @type = Type.find(params[:id])
    @articles = Article.where(type_id: @type).order(created_at: :desc).page(params[:page]).per(20)
  end

  def show
    @article = Article.find(params[:id])
  end

  def show_slideshow
    @articles = Article.all
    @slides = get_slideshow(@articles)
  end

  private
  def get_slideshow(articles)
    slideshow = []
    articles.each do |article|
      slideshow << article if article.image.present?
    end
    slideshow
  end

end
