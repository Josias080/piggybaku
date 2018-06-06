Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: "users/registrations",
        sessions: 'users/sessions'
      }
  root to: 'feelings#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :feelings
  # root to: 'welcome#index'
  # post 'welcome/guest' => 'welcome#guest'
end
