Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands

  resources :albums, except: [:new, :index]
  resources :bands do
    resources :albums, only: [:new]
  end
end
