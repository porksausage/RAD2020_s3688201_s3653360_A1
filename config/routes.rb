Rails.application.routes.draw do
  
  
  root 'posts#index'

  get '', to:'posts#index'
  get  '/newpost',  to: 'posts#new'
  post   '/newpost',   to: 'posts#create'
  get  '/select',  to: 'posts#select'
  get  '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/comment/new',  to: 'comments#new'
  post   '/comment/create',   to: 'comments#create'
  resources :users do
    resources :comments
  end
  resources :posts do
    resources :comments
  end
end
