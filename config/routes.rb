Rails.application.routes.draw do


  resources :abouts
  resources :extras
  resources :careers
  resources :consultancies
  resources :missions
  resources :services
  resources :faqs
  resources :sub_centers
  resources :gcells
  resources :tenders
  resources :it_parks
  resources :policies
  mount Ckeditor::Engine => '/ckeditor'
  resources :downloads
  devise_for :users
  resources :feeds


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home_pages#index'


  get '/about-us' => 'abouts#index', as: :about_us
  get '/search_results' => 'home_pages#search_results', as: :results
  get '/feedbacks' => 'feedbacks#index'

  post '/feedbacks' => 'feedbacks#create', as: :create_feedback

  get '/contact' => 'home_pages#contact', as: :contact

  get '/digital-india' => 'extras#index', as: :digital_india
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
