# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey1'
    )

    User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey4'
    )

    post '/api/v1/auth/login', params: { user_name: 'Joffrey4', password: '112233' }
    @token = JSON.parse(response.body)['token']
    @headers = { ACCEPT: 'application/json', Authorization: @token }
  end

  context '/ route (GET #index)' do
    before(:each) { post '/api/v1/auth/login', params: { user_name: 'Joffrey4', password: '112233' } }

    it 'should be a success when called' do
      expect(response).to have_http_status(:ok)
    end

    it 'should be a success when called' do
      expect(response.body).not_to be_empty
    end

    it 'should be a success when called' do
      @my_response = JSON.parse(response.body)
      expect(JSON.parse(response.body)['user_name']).to eq('Joffrey4')
    end

    it 'should be a success when called' do
      expect(JSON.parse(response.body)['token'].length).to be > 10
    end
  end

  context '/ Users (GET #index)' do
    it 'index method for users should be called successfully' do
      get '/api/v1/users', headers: @headers
      expect(response).to have_http_status(:ok)
    end

    it 'index method for users should should have number of users 2' do
      get '/api/v1/users', headers: @headers
      expect(JSON.parse(response.body).length).to be 2
    end
  end
end
