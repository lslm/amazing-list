Rails.application.routes.draw do
  root "items#index"
  
  resources :items
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
