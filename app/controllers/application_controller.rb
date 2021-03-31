class ApplicationController < ActionController::API
    include ::ActionController::Cookies

    def current_user
        User.find_by(id: session[:user_id])
    end
    def logged_in?
        !!current_user
    end

    def main_state
        challenges = ChallengeSerializer.new(Challenge.all)
        logs = LogSerializer.new(Log.all)
        users = UserSerializer.new(User.all)
        user = UserSerializer.new(current_user)
        main_state = {challenges: challenges, logs: logs, users: users, user: user}
    end

end
