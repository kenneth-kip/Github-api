class DashboardController < ApplicationController
  before_action :username_params, only: :show

  def index
    @user = current_user
  end

  def show
    result = RestClient.get(
      'https://api.github.com/users/' + params[:username],
      accept: :json
    )
    @user = JSON.parse(result)
  end

  def autocomplete
    results = RestClient.get(
      'https://api.github.com/search/users?q=' + params[:q],
      accept: :json
    )
    data_array = JSON.parse(results)
    source = data_array['items'].map do |data|
      data['login']
    end
    render json: source
  end

  private

  def username_params
    params.require(:username)
  end
end
