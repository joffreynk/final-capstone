class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :reservation_date, :return_date, presence: true
  validates :city, presence: true, length: {minimum:3}
  validates :total_fee, presence:true, numericality:true
end
