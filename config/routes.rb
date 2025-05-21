# config/routes.rb
Rails.application.routes.draw do
  # Devise routes for user authentication (sign up, log in, log out)
  devise_for :users

  # Standard RESTful routes for tasks (index, show, new, create, edit, update, destroy)
  resources :tasks

  # Sets the root URL ("/") of your application to the tasks index page
  root to: "tasks#index"

  # Health check route (usually for deployment monitoring)
  get "up" => "rails/health#show", as: :rails_health_check
end
