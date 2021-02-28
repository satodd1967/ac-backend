Rails.application.routes.draw do
  resources :log_scores
  resources :logs
  resources :challenge_goals
  resources :challenges
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
