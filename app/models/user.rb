# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :user_name, :email, :name, :password, presence: true, length: { minimum: 3 }
  validates :user_name, uniqueness: true
end
