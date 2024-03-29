class Api::ChallengeGoalsController < ApplicationController
  before_action :set_challenge_goal, only: [:show, :update, :destroy]

  # GET /challenge_goals
  # def index
  #   challenge_goals = ChallengeGoal.all
  #   render json: ChallengeGoalSerializer.new(challenge_goals)
  # end

  # GET /challenge_goals/1
  # def show
  #   render json: ChallengeGoalSerializer.new(@challenge_goal)
  # end

  # POST /challenge_goals
  def create
    @challenge_goal = ChallengeGoal.new(challenge_goal_params)

    if @challenge_goal.save
      @challenge_goal.cg_create_log_scores
      render json: {challenge_goal: @challenge_goal, main_state: main_state}, status: :created, location: api_challenge_goal_url(@challenge_goal)
    else
      render json: {error: @challenge_goal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenge_goals/1
  def update
    if @challenge_goal.update(challenge_goal_params)
        @challenge_goal.user.logs.each do |log|
        log.update_log_scores
    end
      render json: {challenge_goal: @challenge_goal, main_state: main_state}
    else
      render json: {error: @challenge_goal.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /challenge_goals/1
  def destroy
    if @challenge_goal.destroy
      render json: { destruction: "Challenge Goal destroyed", main_state: main_state }, status: :ok
    else
      render json: @challenge_goal.errors, status: :unprocessable_entity
    end
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
