Rails.application.routes.draw do

  namespace :api do
    resources :log_scores
    resources :logs
    resources :challenge_goals
    resources :challenges
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
