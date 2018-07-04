class AuthenticationController < ApplicationController
  def index
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
    reset_session
    redirect_to '/login'
  end

  private

  def auth_params
    { client_id: ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET'],
      code: request.query_parameters['code'] }
  end

  def user_info
    access_token = session[:access_token]
    result = RestClient.get(
      'https://api.github.com/user',
      accept: :json,
      Authorization: "token #{access_token}"
    )
    JSON.parse(result)
  end
end
