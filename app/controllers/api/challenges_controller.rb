class Api::ChallengesController < ApplicationController
  before_action :set_challenge, only: [:show, :update, :destroy]

  # GET /challenges
  def index
    # @challenges = Challenge.all
    # render json: @challenges
    challenges = Challenge.all
    render json: ChallengeSerializer.new(challenges)
  end

  # GET /challenges/1
  def show
    # render json: @challenge
    render json: ChallengeSerializer.new(@challenge)
  end

  # POST /challenges
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.set_challenge_end_date_create
    if @challenge.save
      render json: {challenge: @challenge, main_state: main_state}, status: :created, location: api_challenge_url(@challenge)
    else
      render json: {error: @challenge.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /challenges/1
  def update
    if @challenge.update(challenge_params)
        @challenge.users.each do |user|
        user.logs.each do |log|
            log.update_log_scores
        end
      end
      render json: {challenge: @challenge, main_state: main_state}
    else
      render json: {error: @challenge.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /challenges/1
  def destroy
    if @challenge.destroy
      render json: { destruction: "Challenge Destroyed", main_state: main_state }, status: :ok
    else
      render json: @challenge.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def challenge_params
      params.require(:challenge).permit(:name, :description, :start_date, :duration, :end_date, :active_calorie_goal, :points_worked_out, :points_tracked_food, :points_met_calorie_goal, :points_maintain_weight, :points_maintain_body_fat, :points_met_active_calorie_goal, :user_id)
    end
end
