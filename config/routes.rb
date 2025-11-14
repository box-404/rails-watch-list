Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'lists/index'
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "lists#index"
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create]
  end

  resources :bookmarks, only: :destroy
  # get "lists", to: "lists#index", as: :lists
  # get "/lists/:id", to: "lists#show", as: :list
  # get "lists/new", to: "lists#new", as: :new_list
  # post "lists", to: "list#create"

  # resources :lists, only: [:show,:index,:create,:new] do
  #   resources :bookmarks, only: [:view, :create]
  # end

end
