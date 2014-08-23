Rails.application.routes.draw do
  resources :ongs do
	  resources :bookings
	end
  resources :challenges
  devise_for :users

  root to: 'static#home'
end
