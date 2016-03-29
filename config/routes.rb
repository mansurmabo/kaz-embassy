Rails.application.routes.draw do

  get 'images_categories/index'

  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'get_news/:id' => 'articles#get_news', as: :get_news
  get 'galleries/get_category/:id' => 'galleries#get_category', as: :get_categories

  resources :articles
  resources :pages, only: [:index, :show]
  resources :categories, only: [:index]
  resources :events, only: [:index]
  resources :galleries, only: [:index, :show]

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
