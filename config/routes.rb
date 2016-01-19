Rails.application.routes.draw do
  resources :sidequests
  root 'session#index'
  resources :answers
  resources :messages
  resources :teachers do
    resources :groups, shallow: true do
      resources :students
    end
    resources :exercises
  end
  
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  put 'classes_update' => 'classescalendar#update'
end
