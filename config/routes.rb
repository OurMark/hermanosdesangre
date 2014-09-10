Rails.application.routes.draw do

  root to: 'static#home'
  devise_for :users
  resources :ongs do
    resources :turnos, controller: :bookings, as: 'bookings'
    resources :objetivos, controller: :challenges, as: 'challenges'
  end

  get '/nosotros', to: 'static#about_us', as: 'about_us'
  get '/campana', to: 'static#campaign', as: 'campaign'
  get '/contacto', to: 'static#contact', as: 'contact'
  get '/informacion', to: 'static#information', as: 'information'
  get '/objetivo', to: 'static#objective', as: 'objective'
  get '/donantes', to: 'static#donors', as: 'donors'

end
