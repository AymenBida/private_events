Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'sessions/welcome'
  resources :sessions, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
