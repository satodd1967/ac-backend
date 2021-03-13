class LogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :log_date,
    :worked_out,
    :tracked_food,
    :weight,
    :body_fat,
    :active_calories,
    :calories,
    :log_scores,
    :user
end
