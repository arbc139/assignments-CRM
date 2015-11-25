Rails.application.routes.draw do
  root 'users#index'

  #################################### LOGIN, LOGOUT, SIGN UP (USER) ####################################
  get '/api/signup'  => 'users#new'
  # each user page
  get '/api/users' => 'users#index'
  post '/api/users' => 'users#create'
  # 로그인 클릭했을 때 Session 생성
  get '/api/login' => 'sessions#new'

  # resources
  # get 'users' => 'users#index'
  # post 'users' => 'users#create'
  # get 'users/:id' => 'users#show'

  #################################### ADMIN ####################################
  # 전체 테스크 목록 가져오기 액션
  get '/api/admin/tasks' => 'tasks#index'
  # 전체 유저 목록 가져오기 액션
  get '/api/admin/users' => 'users#index'
  # 특정 유저 정보 가져오기 액션
  get '/api/admin/users/:id' => 'users#show'


  # 테스크 추가 액션
  post '/api/admin/tasks' => 'tasks#create'


  #################################### SUBMITTER ####################################
  get '/api/submitter' => 'submitter#index'


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