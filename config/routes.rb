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
  get '/donantes', to: 'static#donors', as: 'donors'
  get '/donantes?s=yo-donante', to: 'static#donors', as: 'meDonors'
  get '/donantes?s=requisitos', to: 'static#donors', as: 'requirements'
  get '/donantes?s=consejos', to: 'static#donors', as: 'advises'
  get '/donantes?s=procesos', to: 'static#donors', as: 'procedures'

end
