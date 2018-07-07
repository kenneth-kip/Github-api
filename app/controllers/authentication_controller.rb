class AuthenticationController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    return redirect_to '/' if session[:user_id]
    @client_id = ENV['CLIENT_ID']
  end

  def create
    result = RestClient.post(
      'https://github.com/login/oauth/access_token',
      auth_params,
      accept: :json
    )
    session[:access_token] = JSON.parse(result)['access_token']
    authenticated_user = User.from_github_auth(user_info)
    session[:user_id] = authenticated_user.id
    redirect_to '/'
  end

  def destroy
    clear_sessions
  end

  def deactivate
    current_user.destroy
    clear_sessions
  end

  private

  def auth_params
    { client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      code: request.query_parameters['code'] }
  end

  def user_info
    access_token = session[:access_token]
    url = 'https://api.github.com/user'
    header = { Authorization: "token #{access_token}" }
    fetch_github_info(url, header)
  end

  def clear_sessions
    reset_session
    redirect_to '/login'
  end
end
