Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :users, only: [:create]
  post "/login", to: "users#login"
  post "/sign_up", to: "users#create"
  post "/todo_items", to: "todo#create"
  get "/auto_login", to: "users#auto_login"
end
