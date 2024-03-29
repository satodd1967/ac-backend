class Api::LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  # def index
  #   logs = Log.all
  #   render json: LogSerializer.new(logs)
  # end

  # GET /logs/1
  # def show
  #   render json: LogSerializer.new(@log)
  # end

  # POST /logs
  def create
    @log = Log.new(log_params)
    if @log.save
      @log.create_log_scores
      render json: {log: @log, main_state: main_state}, status: :created, location: api_log_url(@log)
    else
      render json: {error: @log.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(log_params)
      @log.update_log_scores
      render json: {log: @log, main_state: main_state}
    else
      render json: {error: @log.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /logs/1
  def destroy
    if @log.destroy
      render json: { data: "Log Destroyed", main_state: main_state }, status: :ok
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.require(:log).permit(:log_date, :worked_out, :tracked_food, :weight, :body_fat, :active_calories, :calories, :user_id)
    end
end
