Rails.application.routes.draw do


  resources :stocks

  # This is the stock API lookup results page
  # post "/portfolios/:id/shares/search" => "shares#search", as: 'shares_search'
  get "/portfolios/:id/shares/search/submit" => "shares#search", as: 'shares_search'

  # Add the searched share to the portfolio (from the results page)
  post  "/portfolios/:id/shares/:ticker/add" => "shares#create", as: 'share_add'

  # Updating the balance
  # get "/users/:id/balance/operation"
  post "/users/:id/balance" => "users#balance", as: 'user_balance'


  resources :portfolios do
    resources :shares
  end

  resources :users, except: [:index]




  get "/login" => 'session#new' #login form
  post "/login" => 'session#create' #form submits here to perform login
  delete "/login" => 'session#destroy' #logout (delete session)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
