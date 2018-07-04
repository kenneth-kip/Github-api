class AuthenticationController < ApplicationController
  def index
    @client_id = ENV['CLIENT_ID']
  end

  def create
    session_code = request.query_parameters['code']
    result = RestClient.post(
      'https://github.com/login/oauth/access_token',
      { client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        code: session_code },
      accept: :json)
    session[:access_token] = JSON.parse(result)['access_token']
    redirect_to '/'
  end

  def destroy
    reset_session
    redirect_to '/login'
  end
end
