Rails.application.routes.draw do

  resources :stocks
  resources :portfolios
  resources :users, except: [:index]

  get "/login" => 'session#new' #login form
  post "/login" => 'session#create' #form submits here to perform login
  delete "/login" => 'session#destroy' #logout (delete session)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
