class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user
      redirect_to activities_path
    end
  end

  def search
  end

end
