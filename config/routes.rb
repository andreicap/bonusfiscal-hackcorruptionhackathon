Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do 
    get 'logout' => 'devise/sessions#destroy'
  end

  root 'landing#index'

  get '/info', to: 'pages#index'

end
