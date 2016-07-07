Rails.application.routes.draw do
  devise_for :citizens
  resources :tickets
  root 'pages#index'
  get '/lottery', to: 'lottery#index'

  get '/generatewinners', to: 'lottery#generate_winners'
end
