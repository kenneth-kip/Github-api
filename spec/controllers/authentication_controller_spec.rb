require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do

  describe 'POST /callback' do
    before { post 'create', params: { code: '123456789'} }

    # Should be equal to user and login in fixtures
    it 'should return' do
      expect(User.first.name).to eq('joshuaclayton')
      expect(session[:access_token]).to eq('ww34dsfasd4')
    end

    it 'should redirect to dashboard' do
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET /login' do
    context 'When the user is logged in' do
      before do
        session[:user_id] = '1'
        get 'index'
      end

      it 'should redirect to dashboard' do
        expect(response).to have_http_status(302)
      end
    end

    context 'When the user is not logged in' do
      before do
        get 'index'
      end

      it 'should redirect to login page' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /sign_out' do
    context 'When the user logs out' do
      before do
        session[:user_id] = '1'
        delete 'destroy'
      end

      it 'should redirect to login' do
        expect(response).to have_http_status(302)
      end

      it 'should empty the sessions' do
        expect(session.empty?).to be_truthy
      end
    end
  end

  describe 'DELETE /deactivatet' do
    context 'When the user logs out' do
      before do
        post 'create', params: { code: '123456789'}
        delete 'deactivate'
      end

      it 'should redirect to dashboard' do
        expect(response).to have_http_status(302)
      end

      it 'should return no users' do
        expect(User.all.empty?).to be_truthy
      end
    end
  end
end

