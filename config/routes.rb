Rails.application.routes.draw do
  #Trial 1
  #resources :orders

  resources :locations

  resources :line_items

  resources :carts   #Trial 2

  resources :applicants

  devise_for :users
  devise_for :merchants
  
  #Trial 1
  #resources :merchants, only: [:show]
  
  resources :merchants do #Trial 1
    resources :orders   #Trial 1
  end                     #Trial 1

  resources :listings

  get 'pages/about'
  get 'pages/faq'
  get 'pages/contact'
  get 'pages/terms'
  get 'pages/privacy'
  get 'pages/home'
  get 'seller' => "listings#seller"
  get 'address' => "locations#address"
  get 'lintas' => "merchants#lintas"
  get 'damai' => "merchants#damai"
  get 'merchants' => "merchants#index"
  get 'merchants/:id' => "merchants#show"
  get 'sales' => "orders#sales"
  get 'purchases' => "orders#purchases"

  root 'pages#home'

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
