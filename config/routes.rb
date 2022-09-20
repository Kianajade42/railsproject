Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

      root 'lists#index'
 

get '/tasks/:id', to: 'tasks#show', as: :show_task
get '/tasks', to: 'tasks#index'
post '/lists/:id/tasks/new', to: 'tasks#create'
get 'tasks/:id/edit', to: 'tasks#edit', as: :edit_task
patch 'tasks/:id', to: 'tasks#update'
delete 'tasks.:id', to: 'tasks#destroy'
delete 'lists/:id', to: 'lists#destroy'

get '/user/lists', to: 'users/lists#index', as: :user_tasks
  resources :lists, only: [:index, :show, :new, :create, :edit] do
    resources :tasks,  only: [:show, :index, :new, :edit]
end
resources :tasks, only: [:index, :show, :new, :create, :edit, :update]

 devise_for :users
end
Rails.application.configure do
  config.google_sign_in.client_id     = ENV['google_sign_in_client_id']
  config.google_sign_in.client_secret = ENV['google_sign_in_client_secret']
end
Rails.application.routes.draw do
  # ...
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
end