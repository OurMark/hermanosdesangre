Rails.application.routes.draw do
  resources :challenges

  resources :ongs
  devise_for :users

  root to: 'static#home'
end
