Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'sessions/welcome', as: 'welcome'
  delete 'sessions/destroy', as: 'sessions'
  resources :sessions, only: [:create, :new]
  resources :users, only: [:create, :new, :show]
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
