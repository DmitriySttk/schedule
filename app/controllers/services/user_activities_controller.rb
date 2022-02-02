class UserActivitiesController < ApplicationController

  def add
    @user = User.find(session[:user_id])
    @activity = Activity.find(params[:id])
    @user.events << @activity
    flash[:notice] = 'Event was saved.'
  end

end
