Rails.application.routes.draw do
  resources :posts, only: [:show]
  
  devise_for :users, :controllers => {:registrations => 'registrations', :omniauth_callbacks =>  "callbacks"}
  
  devise_scope :user do 
    get 'logout' => 'devise/sessions#destroy'
  end
  post '/auth/:provider/callback' => 'authentications#create'
  resources :authentications, only: [:create, :destroy]
  
  resources :feeds, only: [:create, :destroy]

  get 'authentications' => 'authentications#index'

  root 'landing#index'

  get '/info', to: 'pages#index'

end
