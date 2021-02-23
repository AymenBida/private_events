Rails.application.routes.draw do
  root 'sessions#welcome'
  get 'sessions/welcome', as: 'welcome'
  delete 'sessions/destroy', as: 'sessions'
  resources :sessions, only: [:create, :new]
  resources :users, only: [:create, :new, :show]
  resources :events do
    resources :invitations, only: [:create, :new]
    post 'invitations/attend', as: 'attending'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
