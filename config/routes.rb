Rails.application.routes.draw do

  get 'orders/index'

  get 'orders/create'

  get 'orders/destroy'

  get 'orders/quote'



  devise_for :users, controllers: {
    registrations: 'user/registrations',
    sessions: 'user/sessions'
  }



  resources :products do

    resources :orders, only: :create do
      collection do
        post 'session_quote'
      end
    end

    collection { post :import }

    resources :photos, only: [:create, :destroy]

    member do
      get 'download_ficha'
    end
  end

  resources :orders, only: [:index]

  resources :catalogos, only: [:create, :update] do
    collection do
      get 'download_catalogo'
    end
  end

  get 'pages/index'

  get 'pages/catalogue'

  get 'pages/about'

  get 'pages/contact'

  get 'admin/dashboard'

  get 'admin/catalogo'

  get 'pages/mh3'

  root 'pages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
