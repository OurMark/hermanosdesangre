Rails.application.routes.draw do

  root to: 'static#home'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users do
    resources :ongs
  end
  resources :ongs do
    resources :turnos, controller: :bookings, as: 'bookings'
    get '/turnos-dia', to: 'bookings#day_bookings', as: 'day_bookings'
    resources :objetivos, controller: :challenges, as: 'challenges'
    member do
      get 'bookings'
    end
  end

  get '/nosotros', to: 'static#about_us', as: 'about_us'
  get '/como-funciona', to: 'static#how_works', as: 'how_works'
  get '/campana', to: 'static#campaign', as: 'campaign'
  get '/contacto', to: 'static#contact', as: 'contact'
  get '/donantes', to: 'static#donors', as: 'donors'
  get '/donantes?s=impacto', to: 'static#donors', as: 'impact'
  get '/donantes?s=requisitos', to: 'static#donors', as: 'requirements'
  get '/donantes?s=consejos', to: 'static#donors', as: 'advises'

end
