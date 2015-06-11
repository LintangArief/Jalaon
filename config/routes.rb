Rails.application.routes.draw do
  get '/profile/:id' => 'account#profile', :as => :account
  get '/profile/edit/:id' => 'account#edit', :as => :edit_account
  put '/profile/:id' => 'account#update'
  get '/profile/verify/:id' => 'account#verify', :as => :edit_verify_account
  put '/profile/verify/:id' => 'account#update_verify', :as => :update_verify_account
  post 'foto_product_services/create'
  get '/my-service' => 'services#listing', :as => :my_services
  get '/setting' => 'account#setting', :as => :setting
  post '/follow/service/:id' => 'services#follow', :as => :follow
  put '/unfollow/service/:id' => 'services#unfollow', :as => :unfollow
  resources :product_services

  put 'product_services/update'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :service_categories
  resources :services
  devise_for :users, :controllers => { :registrations => "devise/registrations" }
  root 'statics#home'

  # get 'statics/home' => 'statics#home'
  get '/help' => 'statics#help'
  get '/rules' => 'statics#ruler'
  get '/contactme' => 'statics#contactme'
  get '/aboutme' => 'statics#aboutme'
  get '/listing-user' => 'pages#list_user', :as => :listing_user 
  post '/search' => 'pages#search_user', :as => :search_user
  get '/dasboard' => 'pages#dasboard', :as => :dasboard
  get '/profile/:name/:id' => 'pages#profile', :as => :profile
  match '/add_field' =>  'service_categories#add_field', :via => 'get', :as => :admin_add_field

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
