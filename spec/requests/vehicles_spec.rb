# frozen_string_literal: true

require 'rails_helper'
include Rails.application.routes.url_helpers

RSpec.describe 'Vehicles', type: :request do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey4',
      role: 'admin'
    )
    # Vehicle.create(name: 'BMW', price_per_day: 23.3, model: 'BMW', user_id:  @user.id)
    # Vehicle.create(name: 'BMW1', price_per_day: 23.3, model: 'BMW',  user_id:  1)
    # Vehicle.create(name: 'BMW2', price_per_day: 23.3, model: 'BMW',  user_id:  1)

    post '/api/v1/auth/login', params: { user_name: 'Joffrey4', password: '112233' }
    @token = JSON.parse(response.body)['token']
    @headers = { ACCEPT: 'application/json', Authorization: @token }
  end

  context '/api/v1/vehicles (get #index)' do
    it 'should have status 200' do
      get '/api/v1/vehicles', headers: @headers
      expect(response).to have_http_status(200)
    end
  end
end
