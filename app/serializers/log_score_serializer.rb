class LogScoreSerializer
  include FastJsonapi::ObjectSerializer
  attributes :points_worked_out,
    :points_tracked_food,
    :points_met_calorie_goal,
    :points_maintain_weight,
    :points_maintain_body_fat,
    :points_met_active_calorie_goal
end
