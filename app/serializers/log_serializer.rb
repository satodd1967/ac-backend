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

end
