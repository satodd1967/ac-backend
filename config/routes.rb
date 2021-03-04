Rails.application.routes.draw do

  post "/login", to: "api/sessions#create"
  delete "/logout", to: "api/sessions#destroy"
  get "/get_current_user", to: "api/sessions#get_current_user"

  namespace :api do
    resources :log_scores
    resources :logs
    resources :challenge_goals
    resources :challenges
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
