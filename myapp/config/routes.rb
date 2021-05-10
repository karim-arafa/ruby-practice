Rails.application.routes.draw do
  
  #devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles do
    resources :comments
  end
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get "/auto_login", to: "users#auto_login"
  get 'api/articles', to: 'articles#api_index'
  get 'api/articles/:id', to: 'articles#api_show'
  root 'welcome#index'
end

