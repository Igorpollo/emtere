Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :eventos
  resources :artigos
  devise_for :users
  
  get '/medic/newarticle', to: 'pages#medicnewarticle', as: 'medic'
  get '/medic/allarticles', to: 'pages#medicallarticles'
  get '/login', to: 'pages#login'
  get '/registrar', to: 'pages#register'
  get '/sobre', to: 'pages#aboutus'
  get '/medico/:id', to: 'pages#doctor'
  get '/servicos', to: 'pages#services'
  get '/medicos', to: 'pages#medicos'
  get '/galeria', to: 'pages#galeria'


  root to: "pages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
