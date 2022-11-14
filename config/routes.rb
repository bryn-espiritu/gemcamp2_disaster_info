Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments, except: :show
  end
  resources :categories

  get "/:unique_num", to: "posts#short_url"

  namespace :api do
    resources :regions, only: :index, defaults: { format: :json } do
      resources :province, only: :index, defaults: { format: :json } do
        resources :city_municipality, only: :index, defaults: { format: :json } do
          resources :barangay, only: :index, defaults: { format: :json }
        end
      end
      resources :district, only: :index, defaults: { format: :json } do
        resources :city_municipality, only: :index, defaults: { format: :json } do
          resources :barangay, only: :index, defaults: { format: :json }
        end
      end
    end
  end
end



