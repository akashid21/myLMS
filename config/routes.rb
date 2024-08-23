Rails.application.routes.draw do
  devise_for :admins, only: [:sessions, :registrations], controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do 
    get '/homepage', to: 'page#homepage'
    resources :teachers, only: [:index, :show]
  end

  devise_for :teachers, only: [:sessions, :registrations], controllers: {
    sessions: 'teachers/sessions'
  }
  namespace :teachers do 
    get '/homepage', to: 'page#homepage'
    resources :students
  end

  devise_for :students, controllers: {
    sessions: 'students/sessions'
  }

  namespace :students do
    resources :courses do
      resources :enrollments, only: [:create]
    end
    get 'all_courses', to: 'enrollments#index'
    get '/homepage', to: 'page#homepage'
  end

  get 'homepage', to: 'home#homepage'
	root to: redirect('/homepage')

end
