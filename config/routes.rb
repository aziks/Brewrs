Rails.application.routes.draw do
    
  root 'site#home'

  get 'profile', to: 'users#profile'
  get 'beers_index', to: 'site#index_beers'
  get 'recipes_index', to: 'site#index_recipes'
  get '/users/:user_id/beers', to: 'beers#index', as: 'user_beers'
  
  get '/users/:user_id/recipes', to: 'recipes#index', as: 'user_recipes'
  post '/users/:user_id/recipes', to: 'recipes#create'

  get '/beers/:recipe_id/new', to: 'beers#new', as: 'new_beer'
  post '/beers/:recipe_id', to: 'beers#create', as: 'beers'

  get '/locations/:beer_id/new', to: 'locations#new', as: 'new_location'
  post '/locations/:beer_id', to: 'locations#create', as: 'locations'
  # post '/beers/:id/comment', to: "beers#comment"
  match "/beer/add_new_comment" => "beers#add_new_comment", :as => "add_new_comment_to_beer", :via => [:post]

  devise_for :users

  resources :users, except: [:new, :create, :edit, :update, :destroy]

  resources :recipes, except: [:index]

  resources :beers, except: [:new, :index]

  resources :beers, only: [:show] do
    member do
      put "like", to: "beers#upvote"
      put "dislike", to: "beers#downvote"
    end
  end

  resources :locations, except: [:new, :show, :create]


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
