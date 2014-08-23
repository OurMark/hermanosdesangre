Rails.application.routes.draw do
  resources :badges

  resources :challenges

  resources :ongs do
	  resources :bookings
    resources :challenges
  end
  devise_for :users

  get '/nosotros', to: 'static#about_us', as: 'about_us'

  root to: 'static#home'
end
