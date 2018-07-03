Rails.application.routes.draw do

  resources :eventos
  resources :artigos
  devise_for :users
  
  get '/medic/newarticle', to: 'pages#medicnewarticle', as: 'medic'
  get '/medic/allarticles', to: 'pages#medicallarticles'
  get '/login', to: 'pages#login'
  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
