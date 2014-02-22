SampleApp::Application.routes.draw do
  get "project_feedbacks/new"
  get "project_attributes/new"
#  get "project/new"  # todo: remove these like Listing 7.3?  to be RESTful
  get "company_employees/new"  # will removing this make db:populate also create company_employees without the extra function?
  get "companies/new"
  # get "users/new"  #remove per Listing 7.3
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :projects, only: [:create, :destroy] # todo: do I need resources for my other models also?

  # root 'static_pages#home'
  root 'users#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/leaderboard', to: 'static_pages#leaderboard', via: 'get'  
  match '/give_feedback', to: 'feedbacks#give_feedback', via: 'get'
  match 'feedbacks/complete/:id', to: 'feedbacks#complete', via: 'post' 
  match 'feedbacks/slider_complete/:id', to: 'feedbacks#slider_complete', via: 'post' 
  match '/myfeedback', to: 'users#myfeedback',  via: 'get'
  match '/newproject', to: 'projects#new',      via: 'get'


  #get "static_pages/home"  
  get "users/home"
  get "static_pages/help"
  get "static_pages/about" 
  get "static_pages/contact" 




 
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
