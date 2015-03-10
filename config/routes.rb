Myapp::Application.routes.draw do
  get "sessions/new"
  get "users/new"
  get "home/index"
  get 'hexes/admin' => 'hexes#admin'
  get 'wiproids/admin' => 'wiproids#admin'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post 'data' => 'data#index'
  get 'data' => 'data#index'
  post 'checkout' => 'checkout#index'
  get 'checkout' => 'checkout#index'
  delete 'logout' => 'sessions#destroy'
  get 'group' => 'group#index'
  post 'group' => 'group#create'

  resources :hexes
  resources :wiproids
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  #resources :hexes, only: [:index, :new, :create, :destroy]
  #resources :wiproids, only: [:index, :new, :create, :destroy]
  # You can have the root of your site routed with "root"
  root to: 'hexes#index'
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
