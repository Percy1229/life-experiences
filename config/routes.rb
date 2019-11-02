Rails.application.routes.draw do
  root to: "toppages#index"
  get 'guide', to: 'toppages#guide'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signout', to: "sessions#destroy"

  # new = signup, show = user.page
  resources :users, only:  [:index, :show, :new, :create, :edit, :update] do
    member do
      get :likes
    end
  end
  
  resources :experiences, only: [:new, :create, :edit, :update, :destroy]
  
  resources :relationships, only: [:create, :destroy]
end
