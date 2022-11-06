require 'rails_helper'

RSpec.describe "Reservations", type: :request do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey4',
			role: 'admin',
    )
    post '/api/v1/auth/login', params: {user_name: 'Joffrey4', password: '112233'}
    @token =  JSON.parse(response.body)["token"]
    @headers = { "ACCEPT": "application/json", "Authorization": @token}
  end

	context '/api/v1/reservations (get #index)' do
		it 'should have status 200' do
			get '/api/v1/reservations', headers: @headers
			expect(response).to have_http_status(201)
		end

		it 'show method should be success' do
			get '/api/v1/reservations', headers: @headers
			expect(JSON.parse(response.body).length).to eq(0)
		end
	end
end
