Rails.application.routes.draw do
  
  root "root_page#welcome"

  resources :comments, except: [:index]
  resources :posts, except: [:index]
  get '/home', to: "static_pages#home"
  get '/index', to: "static_pages#index"
  get '/trending', to: "static_pages#trending"
  get '/top', to: "static_pages#top"

  devise_for :users, controllers: { sessions: 'users/sessions', 
                                    passwords: "users/passwords",
                                    registrations: "users/registrations",
                                    confirmations: "users/confirmations",
                                    unlocks: "users/unlocks",
                                    profiles: "users/profiles/:id" }

end
