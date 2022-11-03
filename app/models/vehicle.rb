# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :price_per_day, presence: true, numericality: true
  validates :name, :model, presence: true, length: { minimum: 3 }
end
