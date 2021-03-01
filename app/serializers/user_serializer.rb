class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
    :email,
    :username,
    :image,
    :owned_challenges,
    :logs,
    :log_scores,
    :challenge_goals,
    :challenges 
end
