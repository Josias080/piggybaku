Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: "users/registrations",
        sessions: 'users/sessions'
      }
  root to: 'feelings#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feelings do
    member do
      get 'confirmation'
      patch 'bury'
      patch 'give_flower'
    end
    collection do
      get 'buried'
    end
  end
end
