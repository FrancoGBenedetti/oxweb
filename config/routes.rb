Rails.application.routes.draw do
  devise_for :users
  resources :products do
    collection { post :import }
  end
  
  get 'pages/index'

  get 'pages/catalogue'

  get 'pages/about'

  get 'pages/contact'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
