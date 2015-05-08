Rails.application.routes.draw do
  
  resources :bids
  root 'welcome#index'
  get 'welcome/index'
  
  resources :auctions
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  
end
