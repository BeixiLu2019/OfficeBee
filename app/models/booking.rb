class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  validates :date, presence: true
  validates :number_of_guests, presence: true
  validates :total_price, presence: true
end
