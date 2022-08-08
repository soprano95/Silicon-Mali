Rails.application.routes.draw do
  resources :titles
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
