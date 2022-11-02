# frozen_string_literal: true

class Vehicle < ApplicationRecord
  belongs_to :user

  validates :picture, presence: true, length: { minimum: 10 }
  validates :price_per_day, presence: true, numericality: true
  validates :name, :model, presence: true, length: { minimum: 3 }
end
