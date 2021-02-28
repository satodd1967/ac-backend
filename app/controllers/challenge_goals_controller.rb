class ChallengeGoalsController < ApplicationController
  before_action :set_challenge_goal, only: [:show, :update, :destroy]

  # GET /challenge_goals
  def index
    @challenge_goals = ChallengeGoal.all

    render json: @challenge_goals
  end

  # GET /challenge_goals/1
  def show
    render json: @challenge_goal
  end

  # POST /challenge_goals
  def create
    @challenge_goal = ChallengeGoal.new(challenge_goal_params)

    if @challenge_goal.save
      render json: @challenge_goal, status: :created, location: @challenge_goal
    else
      render json: @challenge_goal.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenge_goals/1
  def update
    if @challenge_goal.update(challenge_goal_params)
      render json: @challenge_goal
    else
      render json: @challenge_goal.errors, status: :unprocessable_entity
    end
  end

  # DELETE /challenge_goals/1
  def destroy
    @challenge_goal.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge_goal
      @challenge_goal = ChallengeGoal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_goal_params
      params.require(:challenge_goal).permit(:start_weight, :start_body_fat, :start_calorie_goal, :user_id, :challenge_id)
    end
end
