Rails.application.routes.draw do
 
  # get 'home/index' esto es igual a la linea 4
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "welcome", to: "home#index"
  get "profile", to: "users#edit"
  resources :users, only: [:update]
  root to: "home#index"

  # get "articles/user/:user_id", to: "articles#by_author"
  # Rutas REST
  
  devise_for :users
  resources :categories do
    get "user/:user_id", to: "categories#from_author", on: :collection
  end
  resources :articles do 
    get "user/:user_id", to: "articles#by_author", on: :collection
  end
  
  # get "articles", to: "articles#index"
  # get "articles/new", to: "articles#new", as: :new_articles
  # get "articles/:id", to: "articles#show"
  # get "articles/:id/edit", to: "articles#edit"

  # patch "articles/:id", to: "articles#update", as: :article
  # post "articles", to: "articles#create"
  # delete "articles/:id", to: "articles#destroy"
end