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
Rails.application.configure do
  config.google_sign_in.client_id     = ENV['google_sign_in_client_id']
  config.google_sign_in.client_secret = ENV['google_sign_in_client_secret']
end
Rails.application.routes.draw do
  # ...
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
 delete 'tasks/:id', to: 'tasks#destroy'

resources :lists do
    collection do
      delete 'destroy_multiple'
    end
  end


end