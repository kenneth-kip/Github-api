class DashboardController < ApplicationController
  before_action :username_params, only: :show

  def index
    @user = current_user
  end

  def show
    url = 'https://api.github.com/users/' + params[:username]
    @user = fetch_github_info(url)
  end

  def autocomplete
    url = 'https://api.github.com/search/users?q=' + params[:q]
    data_array = fetch_github_info(url)
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
