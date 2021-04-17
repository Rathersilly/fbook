Rails.application.routes.draw do
  resources :users
  #root 'static_pages#home'
  root 'users#index'
  get 'static_pages/home'
  get 'static_pages/help'
  get '/help', to: 'static_pages#help', as: 'help'
  get '/home', to: 'static_pages#home', as: 'home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/admin_login', to: 'sessions#admin_login'

  post '/request_friend', to: 'users#request_friend'
  delete '/remove_friend', to: 'users#remove_friend'
  delete '/unfriend', to: 'users#remove_friend'

  post 'accept_freq', to:  'freqs#accept', as: :accept_freq
  post 'deny_freq', to:  'freqs#deny', as: :deny_freq
  post 'cancel_freq', to:  'freqs#cancel', as: :cancel_freq
  delete 'delete_freq', to: 'freqs#destroy', as: :delete_freq

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

