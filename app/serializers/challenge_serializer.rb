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
    :users,
    :challenge_goals,
    :logs,
    :log_scores

    attribute :user do |object|
      {
        id: object.user.id,
        username: object.user.username,
        email: object.user.email,
        image: object.user.image
      }
    end

    attribute :users do |object|
      object.users.map do |user|
        {
          id: user.id,
          username: user.username,
          email: user.email,
          image: user.image
        }
      end
    end

end
