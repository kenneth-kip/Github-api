# spec/support/fake_github.rb
require 'sinatra/base'

class FakeGithub < Sinatra::Base
  get '/user' do
    json_response 200, 'user.json'
  end

  get '/users/joshuaclayton' do
    json_response 200, 'user.json'
  end
  
  get '/search/users' do
    json_response 200, 'users.json'
  end

  private
  
  def json_response(response_code, file_name)
   content_type :json
   status response_code
   File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end