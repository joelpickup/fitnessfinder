Rails.application.routes.draw do
  resources :bookings
  resources :lessons

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root to: "home#index"

  get 'dashboard' => 'home#dashboard'
  get 'find_instructor' => 'lessons#index'

  get "profiles/:id", to: "users#show"

  get "users/show"


  get "profiles/:id", to: "users#show"
  post "profiles/:id", to: "users#show"
  get "my_messages", to: "messages#messages"
  post "my_messages", to: "messages#create", :as => "new_conversation"
  get "my_messages/:id", to: "messages#conversation", :as => "conversation"
  post "my_messages/:id", to: "messages#reply", :as => "reply"


  resources :users do
    resources :comments
    resources :lessons
    member do
      post "like", to: "votes#upvote"
      post "dislike", to: "votes#downvote"
    end
  end
  
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
