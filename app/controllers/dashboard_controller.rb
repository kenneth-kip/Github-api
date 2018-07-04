class DashboardController < ApplicationController
  def index
    return redirect_to '/login' unless user_signed_in?
  end
end
