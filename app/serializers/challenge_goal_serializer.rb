class ChallengeGoalSerializer
  include FastJsonapi::ObjectSerializer
  attributes :start_weight,
    :start_body_fat,
    :start_calorie_goal,
    :log_scores

end
