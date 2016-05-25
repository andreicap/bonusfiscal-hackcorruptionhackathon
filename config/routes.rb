Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  devise_scope :user do 
    get 'logout' => 'devise/sessions#destroy'
  end

  root 'landing#index'

  get '/info', to: 'pages#index'

end
