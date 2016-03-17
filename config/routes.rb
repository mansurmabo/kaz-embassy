Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'get_news/:id' => 'articles#get_news', as: :get_news
  resources :articles
  resources :pages
  resources :categories
  resources :galleries

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
