class HomeController < ApplicationController
  before_action :authenticate_user!, except: %i[show about]

  def index
    if current_user
      redirect_to activities_path
    end
  end

  def about
  end

end
