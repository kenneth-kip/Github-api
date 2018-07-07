require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET /' do
    context 'When the user visits dashboard and is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :index
      end

      it 'should redirect to dashboard' do
        expect(response).to render_template('dashboard/index')
      end

      it 'should return 200 status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'When the user visits dashboard and is logged out' do
      before do
        get :index
      end

      it 'should redirect to login page' do
        expect(response).to have_http_status(302)
      end
    end
  end

  describe 'GET dashboard/:user' do
    context 'When the user visits dashboard and is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :show, params: { username: 'joshuaclayton' }
      end

      it 'should redirect to users dashboard' do
        expect(response).to render_template('dashboard/show')
      end

      it 'should return 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'GET dashboard/autcomplete' do
    context 'When the user visits dashboard and is logged in' do
      let(:user) { create(:user) }

      before do
        sign_in user
        get :autocomplete, params: { q: 'm' }
      end
      
      # should contain name from the users fixtures
      it 'should return array with two names' do
        expect(JSON.parse(response.body)).to eq(["mojombo", "mambo"])
      end

      it 'should return 200' do
        expect(response).to have_http_status(200)
      end
    end
  end
end
