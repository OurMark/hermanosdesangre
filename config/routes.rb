Rails.application.routes.draw do

  resources :ongs do
	  resources :turnos, controller: :bookings, as: 'bookings'
    resources :objetivos, controller: :challenges, as: 'challenges'
  end
  devise_for :users

  get '/nosotros', to: 'static#about_us', as: 'about_us'
  get '/campana', to: 'static#campaign', as: 'campaign'
  get '/contacto', to: 'static#contact', as: 'contact'
  get '/informacion', to: 'static#information', as: 'information'

  root to: 'static#home'
end
