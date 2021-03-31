class Api::MainStateController < ApplicationController

    def get_main_state
        if logged_in?
            render json: {main_state: main_state}
        else
            render json: {
                error: "No one logged in"
            }
        end
    end

end