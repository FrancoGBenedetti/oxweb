Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'user/sessions',
    registrations: 'user/registrations'
  }

  resources :products do
    collection { post :import }
    resources :photos, only: [:create, :destroy]
  end

  get 'pages/index'

  get 'pages/catalogue'

  get 'pages/about'

  get 'pages/contact'

  get 'admin/dashboard'

  get 'pages/mh3'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
