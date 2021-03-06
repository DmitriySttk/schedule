class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @q = Activity.ransack(params[:q])
    @pagy, @activities = pagy(@q.result)

    respond_to do |format|
      format.html
      format.csv { send_data Activity.to_csv, filename: "activities-#{Date.today}.csv" }
    end
  end

  # GET /activities/1 or /activities/1.json
  def show
    @members = @activity.members
    if current_user
      @current_registration = current_user.registrations.find_by(activity_id: @activity.id)
    end
  end


  # GET /activities/new
  def new
    @activity = Activity.new
    authorize @activity
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    if authorize @activity
      respond_to do |format|
        if @activity.update(activity_params)
          format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
          format.json { render :show, status: :ok, location: @activity }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @activity.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    if authorize @activity
      @activity.destroy
      respond_to do |format|
        format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:name, :email, :phone, :description, :map)
  end
end
