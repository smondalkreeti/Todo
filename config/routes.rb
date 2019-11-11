Rails.application.routes.draw do
  root "sessions#new"
  get "/login", to: 'sessions#new'
  post 'sessions/create'
  get "/logout", to: 'sessions#destroy'
  get "/signup", to: 'users#new'
  resources :users, only: [:new, :create, :show] do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
