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

    attribute :user do |object|
      {
        id: object.user.id,
        username: object.user.username,
        email: object.user.email,
        image: object.user.image
      }
    end

    attribute :log_scores do |log|
      log.log_scores.map do |ls|
        {
          id: ls.id,
          points_worked_out: ls.points_worked_out,
          points_tracked_food: ls.points_tracked_food,
          points_met_calorie_goal: ls.points_met_calorie_goal,
          points_maintain_weight: ls.points_maintain_weight,
          points_maintain_body_fat: ls.points_maintain_body_fat,
          points_met_active_calorie_goal: ls.points_met_active_calorie_goal,
          total_points: ls.total_points,
          challenge: ls.challenge_goal.challenge.name
        }
      end
    end

end
