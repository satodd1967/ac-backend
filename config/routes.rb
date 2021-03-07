Rails.application.routes.draw do

  post "/login", to: "api/sessions#create"
  post "/signup", to: "api/users#create"
  delete "/logout", to: "api/sessions#destroy"
  get "/get_current_user", to: "api/sessions#get_current_user"

  namespace :api do
    resources :log_scores
    resources :challenges

    resources :challenges, only: [] do
      resources :challenge_goals, only: [:new, :create]
    end

    resources :logs
    resources :challenge_goals
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
