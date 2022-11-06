# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Reservation, type: :model do
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

    @reservation = Reservation.create(
      reservation_date: '11/11/2022'.to_date,
      return_date: '15/11/2022'.to_date,
      city: 'kanyosha',
      total_fee: 36.6,
      user_id: @user.id,
      vehicle_id: @vehicle.id
    )
  end

  it 'Reservatiom city should be present' do
    @reservation.city = nil
    expect(@reservation).to_not be_valid
  end

  it 'Reservatiom city should have 3 characters' do
    @reservation.city = 'US'
    expect(@reservation).to_not be_valid
  end

  it 'Reservatiom date should not be nil' do
    @reservation.reservation_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'Reservatiom return date should shoulb be a date' do
    @reservation.return_date = 'BM'
    expect(@reservation).to_not be_valid
  end

  it 'Reservatiom return date should be present' do
    @reservation.return_date = nil
    expect(@reservation).to_not be_valid
  end
end
