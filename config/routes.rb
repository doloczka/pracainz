Rails.application.routes.draw do

  root 'session#index'
  get 'presence/update'
  get 'lesson' => 'exercises#lesson'
  post 'lesson' => 'exercises#lesson'
  post 'new_result' => 'result#create'
  patch 'edit_result' => 'result#update'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  scope '/' do
    resources :sidequests
    resources :sqanswers
    resources :sqresults
    resources :answers
    resources :messages
    resources :teachers do
      resources :groups, shallow: true do
        resources :students
      end
      resources :exercises, shallow: true
    end
  end
  get 'show_exe' => 'exercises#show_exe'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  put 'sqanswer_update' => 'sidequests#sqanswer_update'
  put 'classes_update' => 'classescalendar#update'
  put 'presences_update' => 'presence#update'
  get 'student/edit' => 'students#edit'
  get 'faq' => 'students#faq'
  patch 'student/solution' => 'students#solution'
  get 'student/studentprofile' =>  'students#studentprofile'
  get 'student/hppotion' =>  'students#hppotion'
  get 'contact', to: 'my_mail#new', as: 'contact'
  post 'contact', to: 'my_mail#create'
  get 'settings' => 'students#settings'
end
