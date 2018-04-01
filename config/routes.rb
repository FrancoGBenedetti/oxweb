Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/create'

  get 'orders/destroy'

  get 'orders/quote'

  devise_for :users



  resources :products do
    resources :orders, only: :create
    collection { post :import }
    resources :photos, only: [:create, :destroy]
  end

  resources :orders, only: [:index]

  get 'pages/index'

  get 'pages/catalogue'

  get 'pages/about'

  get 'pages/contact'

  get 'admin/dashboard'

  get 'pages/mh3'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
