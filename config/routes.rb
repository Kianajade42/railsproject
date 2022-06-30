Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
      #  root 'tasks#index'
      #  resources :tasks
        root 'lists#index'
get '/user/lists', to: 'users/lists#index', as: :user_tasks
  resources :lists do
    resources :tasks
end
 devise_for :users
end