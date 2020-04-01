Rails.application.routes.draw do
  
  resources :comments, except: [:index]
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  get '/home', to: "static_pages#home"
  get '/index', to: "static_pages#index"
  get '/trending', to: "static_pages#trending"
  get '/top', to: "static_pages#top"

  devise_scope :user do
    root to: "users/sessions#new"
  end
  devise_for :users, controllers: { sessions: 'users/sessions', 
                                    passwords: "users/passwords",
                                    registrations: "users/registrations",
                                    confirmations: "users/confirmations",
                                    unlocks: "users/unlocks" }

end
