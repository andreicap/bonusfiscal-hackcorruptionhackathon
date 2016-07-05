Rails.application.routes.draw do
  devise_for :citizens
  root 'pages#index'
  get 'registerticket' => 'lottery#register_ticket'
end
