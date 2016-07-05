Rails.application.routes.draw do
  devise_for :citizens
  root 'pages#index'
end
