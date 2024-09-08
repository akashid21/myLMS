Rails.application.routes.draw do
  devise_for :admins, only: %i[sessions registrations], controllers: {
    sessions: 'admins/sessions'
  }

  namespace :admins do
    get '/homepage', to: 'page#homepage'
    resources :teachers, only: %i[index show]
  end

  devise_for :teachers, only: %i[sessions registrations], controllers: {
    sessions: 'teachers/sessions'
  }
  namespace :teachers do
    get '/homepage', to: 'page#homepage'
    resources :students
    resources :courses, only: %w[index show]
    patch 'update_avatar', to: 'avatar#update_avatar'
    get 'edit_avatar', to: 'avatar#edit_avatar'
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
