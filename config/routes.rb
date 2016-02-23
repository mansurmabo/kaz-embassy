Rails.application.routes.draw do
  root 'articles#index'
  resources :articles
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActiveAdmin::Tinymce::Engine => '/', as: 'admin_editor'

end
