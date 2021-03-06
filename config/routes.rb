require 'sidekiq/web'

Rails.application.routes.draw do


  mount Sidekiq::Web => '/sidekiq'
  root 'flea_markets#index'

  resources :flea_markets

  resources :chats, only: [:index, :show]
  resources :messages, only: [:create]

  devise_for :users, path: :admin

  namespace(:admin){

    root "flea_markets#index"
    resources :flea_markets
    resources :users
    resources :parse_configs
    resources :parsing_filters
    resources :parsings do 
      get :move, on: :member
    end
  }

  namespace(:api){
    resources :flea_markets do
      get :get_latlon, on: :collection
      get :find_registered_location, on: :collection
    end
    post 'uploads' => 'content_images#create'
    delete 'removes' => 'content_images#destroy'


  }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
