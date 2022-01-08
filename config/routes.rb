Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'

  # When you denote :articles like this, this not only exposes all possible routes, it also exposes a REST API
  # for your articles resource
  resources :articles
end
