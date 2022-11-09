# frozen_string_literal: true

class Vehicle < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :reservations, dependent: :destroy
  validates :price_per_day, presence: true, numericality: true
  validates :name, :model, presence: true, length: { minimum: 3 }

  def picture_url
    Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
  end
end
