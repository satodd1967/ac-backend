Rails.application.routes.draw do

  post "/login", to: "api/sessions#create"
  post "/signup", to: "api/users#create"
  delete "/logout", to: "api/sessions#destroy"
  get "/get_current_user", to: "api/sessions#get_current_user"
  get "/api/main_state", to: "api/main_state#get_main_state"

  namespace :api do
    # resources :log_scores
    resources :challenges, only: [:new, :edit, :create, :update, :destroy]

    resources :challenges, only: [] do
      resources :challenge_goals, only: [:new, :create]
    end

    resources :logs, only: [:new, :edit, :create, :update, :destroy]
    resources :challenge_goals, only: [:new, :edit, :create, :update, :destroy]
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
