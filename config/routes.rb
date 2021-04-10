Rails.application.routes.draw do
  resources :users
  root 'static_pages#home'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/help', to: 'static_pages#help', as: 'help'
  get '/home', to: 'static_pages#home', as: 'home'
  get '/signup', to: 'users#new'

  post '/add_friend', to: 'users#add_friend'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
