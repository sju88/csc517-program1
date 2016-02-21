Rails.application.routes.draw do
  get 'ctemps/new'

  get 'coursetemp/new'

  get 'instructor_sessions/new'

  get 'instructors/new'

  get 'student_sessions/new'

  get 'students/new'

  get 'sessions/new'

  get 'admins/new'

  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'admins#new'
  get 'signup_student'  => 'students#new'
  get 'signup_instructor'  => 'instructors#new'
  get 'signup_course'  => 'courses#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'student_login'   => 'student_sessions#new'
  post   'student_login'   => 'student_sessions#create'
  delete 'student_logout'  => 'student_sessions#destroy'
  get    'instructor_login'   => 'instructor_sessions#new'
  post   'instructor_login'   => 'instructor_sessions#create'
  delete 'instructor_logout'  => 'instructor_sessions#destroy'
  
  get 'history'  => 'students#history'
  get 'req'  => 'instructors#req'
  get 'student_enrollment'  => 'students#enrollment'
  get 'course_view'  => 'students#course_view'
  get 'search'  => 'students#search'
  post 'search'   => 'students#results'
  
  resources :admins
  resources :students
  resources :instructors
  resources :courses
  resources :ctemps
  
end