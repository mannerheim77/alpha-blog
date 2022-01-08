Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  #resources :articles  #shortcut way to give you all CRUD routes for articles
  #resources :articles, only: [:show]  #only exposes the GET
  # resources :articles, only: [:show, :index]
  resources :articles, only: [:show, :index, :new, :create, :edit, :update]

end
