class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  validates :date, presence: {message: "Date cannot be blank."}
  #validates :number_of_guests, presence: true

   validate :after_booking_capacity

   def after_booking_capacity
     # if number_of_guests > office.max_capacity - office.bookings.sum(:number_of_guests)
     #   errors.add(:number_of_guests, "Unfortunately, we don't have enough spaces at the moment.")
     # end
   end
   #call self.office_id then find the office with the self.office_id
end
