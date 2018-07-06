class DashboardController < ApplicationController
  before_action :username_params, only: :show

  def index
    @user = current_user
    @searches = current_user.searches.order(created_at: :desc).limit(5)
  end

  def show
    url = 'https://api.github.com/users/' + params[:username]
    @user = fetch_github_info(url)
    log_search
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

  def log_search
    current_user.searches.create(name: params[:username])
  end
end
