Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: "users/registrations",
        sessions: 'users/sessions'
      }
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  root to: 'feelings#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feelings do
    member do
      get 'confirmation'
      put 'bury'
      put 'like', to: "feelings#like"
    end
    collection do
      get 'buried'
    end
    resources :donations, only: [:new, :create]
  end
end
