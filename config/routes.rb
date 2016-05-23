Rails.application.routes.draw do
  devise_for :users
  
  root 'landing#index'

  get '/info', to: 'pages#index'

end
