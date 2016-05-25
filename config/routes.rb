Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks =>  "callbacks"}
  
  devise_scope :user do 
    get 'logout' => 'devise/sessions#destroy'
  end
  post '/auth/:provider/callback' => 'authentications#create'
  resources :authentications, only: [:create, :destroy]

  root 'authentications#index'

  get '/info', to: 'pages#index'

end
