Rails.application.routes.draw do
  resources :powers, only: [:index, :show]
  resources :heroines, only: [:index, :show, :new, :create] do
    collection do
      get :search, :action => 'search_post', :as => 'search_post'
    end
  end

end
