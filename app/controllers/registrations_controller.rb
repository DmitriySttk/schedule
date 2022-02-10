class RegistrationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_activity

  def create
    @activity.registrations.create!(user: current_user)
    redirect_to @activity, notice: 'yep!'
  end

  def destroy
    registration = current_user.registrations.find(params[:id])
    registration.destroy
    redirect_to @activity, notice: 'registration canceled'
  end

  private

  def set_activity
    @activity = Activity.find(params[:activity_id])
  end
end
