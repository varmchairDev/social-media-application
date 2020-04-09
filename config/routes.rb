Rails.application.routes.draw do
  
  root "root_page#welcome"

  resources :comments, except: [:index]
  resources :posts, except: [:index]
  get '/home', to: "static_pages#home"
  get '/index', to: "static_pages#index"
  get '/trending', to: "static_pages#trending"
  get '/top', to: "static_pages#top"
  get "/profiles/:id", to: "profiles#show"
  get "/profiles/:id/friends", to: "profiles#friends"
  get "/profiles/:id/posts", to: "profiles#user_posts"
  get "/profiles/:id/comments", to: "profiles#user_comments"
  delete "/delete/user/:id", to: "delete_user#destroy"
  post "/like/post", to: "liking_posts#create"
  post "/like/comment", to: "liking_comments#create"

  devise_for :users, controllers: { sessions: 'users/sessions', 
                                    passwords: "users/passwords",
                                    registrations: "users/registrations",
                                    confirmations: "users/confirmations",
                                    unlocks: "users/unlocks"            }

end
