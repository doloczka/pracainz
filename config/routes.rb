Rails.application.routes.draw do

  resources :sqanswers
  resources :sqresults
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
  put 'sqanswer_update' => 'sidequests#sqanswer_update'
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
  get 'student/surender' =>  'students#surender'
end
