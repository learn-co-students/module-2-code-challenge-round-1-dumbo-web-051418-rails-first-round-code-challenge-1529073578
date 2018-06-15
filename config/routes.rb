Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create]

  post '/', to: 'heroines#index', as: 'filter_power_heroine'
end
