Rails.application.routes.draw do
  mount Registration::API => '/'
  mount Login::API => '/'
  mount PostCreate::Base => '/'

  # devise_for :users 
  # resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


