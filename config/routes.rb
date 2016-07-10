Rails.application.routes.draw do

  devise_for :citizens, :controllers => { registrations: 'registrations' }
  resources :tickets
  resources :submissions
  root 'pages#index'
  get '/lottery', to: 'lottery#index'
  get '/generatewinners', to: 'lottery#generate_winners'
  get '/report', to: 'pages#report'
  get '/faq', to: 'pages#faq'
end
