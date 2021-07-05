Rails.application.routes.draw do
  root 'users#new', as: '/'
  resources :users, only: [:new, :create, :edit, :update]
end
