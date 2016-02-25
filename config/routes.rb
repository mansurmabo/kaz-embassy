Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  resources :articles
  resources :pages
  resources :categories

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
