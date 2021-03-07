class ChallengeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name,
    :description,
    :start_date,
    :duration,
    :end_date,
    :active_calorie_goal,
    :points_worked_out,
    :points_tracked_food,
    :points_met_calorie_goal,
    :points_maintain_weight,
    :points_maintain_body_fat,
    :points_met_active_calorie_goal,
    :user_id,
    :user,
    :challenge_goals,
    :users,
    :logs,
    :log_scores
end
