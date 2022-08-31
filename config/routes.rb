Rails.application.routes.draw do
  resources :categories
  authenticated :user, ->(user) { user.admin? } do
    get 'admin', to: 'admin#index'
    get 'admin/blogs'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_blog/:id', to: 'admin#show_blog', as: 'admin_blog'
  end
  get 'search', to: 'search#index'
  
 devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/u/:id', to: 'users#profile', as: 'user'

  resources :after_signup


  resources :blogs do
    resources :comments
  end
  
  get 'pages/about'
  get 'pages/contact'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#index"
end
