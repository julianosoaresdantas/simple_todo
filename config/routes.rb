# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  resources :waste_entries # This creates all 7 RESTful routes for WasteEntry

  # You can set a root path if you don't have one, or comment it out for now
  # For example, to make waste_entries the homepage after login:
  # root to: "waste_entries#index"
end
