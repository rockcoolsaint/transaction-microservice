Rails.application.routes.draw do
  get '/users', to: "users#index"
  post '/users', to: "users#create"

  get '/transactions', to: "account_transactions#index"
  get '/transactions/:id', to: "account_transactions#show"
  post '/transactions', to: "account_transactions#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
