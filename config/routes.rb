Rails.application.routes.draw do
  root 'users#index', as: '/'
  resources :users, only: [:index, :new, :create, :update, :destroy, :show, :edit]
end
