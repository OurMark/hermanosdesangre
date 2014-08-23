Rails.application.routes.draw do
  resources :badges

  resources :challenges

  resources :ongs do
	  resources :bookings
    resources :challenges
  end
  devise_for :users

  root to: 'static#home'
end
