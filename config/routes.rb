Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :edit, :create]
  # get '/powers/:id', to: 'powers#search', as: 'power'
end
