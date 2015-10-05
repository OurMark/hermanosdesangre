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
    get '/calendar', to: 'ongs#calendar', as: 'calendar'
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
  get '/donantes?s=informacion', to: 'static#donors', as: 'more_info'
  get '/registro-ong', to: 'ongs#ong_registered', as: 'ong_registered'
  get '/buscar-registro-ong', to: 'ongs#ong_search', as: 'ong_search'


end
