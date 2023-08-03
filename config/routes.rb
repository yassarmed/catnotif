Rails.application.routes.draw do
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/mycats" => "users#index"

  get "/login" => "sessions#new"
  post "/sessions" => "sessions#create"
  get "/logout" => "sessions#destroy"

  resources :catfeedings, only: [:new, :create]

  get "/", to: "pages#home"
  get "/user_dashboard", to: "pages#user_dashboard"

  get "/addcat" => "cats#new"
  post "/cats" => "cats#create"

  resources :cats do
    member do
      get :edit_feeding_times
      patch :update_feeding_times
    end
  end
end
