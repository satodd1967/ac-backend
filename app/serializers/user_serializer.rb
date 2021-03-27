class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id,
    # :email,
    :username,
    :image,
    :owned_challenges,
    :logs,
    :challenge_goals,
    :challenges

    attribute :logs do |user|
      user.logs.map do |log|
        {
          id: log.id,
          user_id: log.user_id,
          log_date: log.log_date,
          worked_out: log.worked_out,
          tracked_food: log.tracked_food,
          weight: log.weight,
          body_fat: log.body_fat,
          active_calories: log.active_calories,
          calories: log.calories,
          log_scores: log.log_scores.map do |ls|
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
        }
      end
    end

end


