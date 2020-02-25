class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.integer :number_of_guests
      t.references :user, foreign_key: true
      t.references :office, foreign_key: true
      t.integer :total_price

      t.timestamps
    end
  end
end
