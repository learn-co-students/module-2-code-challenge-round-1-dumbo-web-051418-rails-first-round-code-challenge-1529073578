Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create] do
    collection do
      get :search, :action => 'search_post', :as => 'search_post'
      get 'search/:q', :action => 'search', :as => 'search'
    end
  end

end
