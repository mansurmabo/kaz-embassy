Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'get_news/:id' => 'articles#get_news', as: :get_news

  resources :articles
  resources :pages, only: [:index, :show]
  resources :categories, only: [:index]
  resources :events, only: [:index]
  resources :galleries, only: [:index, :show]

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
