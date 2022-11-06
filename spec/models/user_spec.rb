# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
      name: 'Joffrey',
      email: 'joffrey@email.com',
      password: '112233',
      user_name: 'Joffrey1'
    )
    @user.save!
  end

  context 'User Model Properties' do
    it 'name should be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'user name should be present' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'password should be present' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'user name should be unique' do
      @duplicate_user = User.new(
        name: 'Joffrey',
        email: 'joffrey@email.com',
        password: '112233',
        user_name: 'Joffrey1'
      )
      expect(@duplicate_user).to_not be_valid
    end
  end
end
