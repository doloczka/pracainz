Rails.application.routes.draw do
  get 'presence/update'

 post 'new_result' => 'result#create'
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  resources :sidequests
  root 'session#index'
  resources :answers
  resources :messages
  resources :teachers do
    resources :groups, shallow: true do
      resources :students
    end
    resources :exercises, shallow: true
  end
  get 'show_exe' => 'exercises#show_exe'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  put 'classes_update' => 'classescalendar#update'
  put 'presences_update' => 'presence#update'
  get 'student/edit' => 'students#edit'
  get 'student/lesson1' => 'students#lesson1'
  get 'student/lesson2' =>'students#lesson2'
  get 'student/lesson3' =>'students#lesson3'
  get 'student/lesson4' =>'students#lesson4'
  get 'student/lesson5' =>'students#lesson5'
  get 'student/lesson6' =>'students#lesson6'
  post 'student/solution' => 'students#solution'
  get 'student/challenge' =>'students#challenge'
  get 'student/chosechallenge' =>'students#chosechallenge'
  get 'student/challengeodp' =>'students#challengeodp'
  get 'student/challengeodp2' =>'students#challengeodp2'
  get 'student/challengeinbox' =>'students#challengeinbox'
  post 'student/challengeconfirm' =>'students#challengeconfirm'
  post 'student/challengeconfirm2' =>'students#challengeconfirm2'
  get 'challenges' => 'challenge#index'
  post 'challenge_win' => 'challenge#win'
  post 'challenge_draw' => 'challenge#draw'
  
  
  
 
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
