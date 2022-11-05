require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  before(:each) do
    @user = User.create(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey1'
    )

    @vehicle = Vehicle.create(
      name: 'Range Rover',
      price_per_day: 25.6,
      model: 'MBW 2025',
      user_id: @user.id
    )
  end

  it 'Vehicle name should be present' do
    @vehicle.name = nil
    expect(@vehicle).to_not be_valid
  end

  it 'Vehicle name should have 3 characters' do
    @vehicle.name = 'TO'
    expect(@vehicle).to_not be_valid
  end

  it 'Vehicle name should not be nil' do
    @vehicle.model = nil
    expect(@vehicle).to_not be_valid
  end

  it 'Vehicle model should have 3 minimum characters' do
    @vehicle.model = 'BM'
    expect(@vehicle).to_not be_valid
  end

  it 'Vehicle daily rent price should be present' do
    @vehicle.price_per_day = 2.7
    expect(@vehicle).to be_valid
  end
end
