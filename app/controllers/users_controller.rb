class UsersController < ApplicationController
  def index
    @users = User.all
    authorize @users

    respond_to do |format|
      format.html
      format.csv { send_data @users.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def show
    @user = User.find(params[:id])
    @run_activities = @user.run_activities
  end
end