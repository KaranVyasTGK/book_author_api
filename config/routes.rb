Rails.application.routes.draw do
  apipie
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  
  namespace :api do
  	post 'login' => "sessions#create"
  	get 'search' => "books#search"
  	post 'logout' => "sessions#destroy"
  end
end
