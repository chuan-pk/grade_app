Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students
  resources :courses do
    resources :attempts
  end
  resources :sessions, only: [:new, :create, :destroy]
  
  root :to => redirect('/courses')

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'attempts', to: 'attempts#attempt_courses', as: 'attempt_courses'
  post 'attempts', to: 'attempts#confirm'
end
