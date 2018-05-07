Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :new, :create]
  resources :items, only: [:show, :new]
  resources :itemrelationships, only: [:create, :destroy]
  
  resources :institutions, only: [:index, :show, :new, :create] do
    resources :institutionmicroposts, only: [:show, :new, :create, :edit, :update, :destroy], shallow: true
  end
  resources :problemmicroposts, only: [:index, :show, :new, :create, :destroy] do
    resources :solutions, only: [:show, :new, :create], shallow: true
  end
  
end
