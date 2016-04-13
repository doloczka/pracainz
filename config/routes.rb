Rails.application.routes.draw do


  get 'presence/update'
  get 'lesson' => 'exercises#lesson'
  post 'lesson' => 'exercises#lesson'
  post 'new_result' => 'result#create'
  patch 'edit_result' => 'result#update'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  root 'session#index'
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
  patch 'result/update' => 'result#update'
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
  get 'student/surender' =>  'students#surender'
  get 'student/studentprofile' =>  'students#studentprofile'
  get 'student/hppotion' =>  'students#hppotion'
  get 'contact', to: 'my_mail#new', as: 'contact'
  post 'contact', to: 'my_mail#create'
  get 'settings' => 'students#settings'
end
