Rails.application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    get 'images_categories/index'
    get 'get_news/:id' => 'articles#get_news', as: :get_news
    get 'galleries/get_category/:id' => 'galleries#get_category', as: :get_categories
    get 'search', to: 'search#search'
    resources :articles
    resources :manifestos
    resources :pages, only: [:index, :show]
    resources :categories, only: [:index]
    resources :events, only: [:index]
    resources :galleries, only: [:index, :show]
    resources :co_events, only: [:index, :show]
    root to: "articles#index"

  end
  get '/' => 'articles#index'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

#  match '*path', to: redirect("/#{I18n.default_locale}/%{path}")
 # match '*', to: redirect("/#{I18n.default_locale}/")
end
