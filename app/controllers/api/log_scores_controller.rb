class Api::LogScoresController < ApplicationController
  before_action :set_log_score, only: [:show, :update, :destroy]

  # GET /log_scores
  def index
    # @log_scores = LogScore.all
    # render json: @log_scores
    log_scores = LogScore.all
    render json: LogScoreSerializer.new(log_scores)
  end

  # GET /log_scores/1
  def show
    # render json: @log_score
    render json: LogScoreSerializer.new(@log_score)
  end

  # POST /log_scores
  def create
    @log_score = LogScore.new(log_score_params)

    if @log_score.save
      render json: @log_score, status: :created, location: @log_score
    else
      render json: @log_score.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /log_scores/1
  def update
    if @log_score.update(log_score_params)
      render json: @log_score
    else
      render json: @log_score.errors, status: :unprocessable_entity
    end
  end

  # DELETE /log_scores/1
  def destroy
    @log_score.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log_score
      @log_score = LogScore.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_score_params
      params.require(:log_score).permit(:points_worked_out, :points_tracked_food, :points_met_calorie_goal, :points_maintain_weight, :points_maintain_body_fat, :points_met_active_calorie_goal, :total_points, :log_id, :challenge_goal_id)
    end
end
