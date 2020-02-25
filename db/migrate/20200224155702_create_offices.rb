class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :city
      t.date :start_date
      t.date :end_date
      t.integer :max_capacity
      t.integer :price
      t.string :address
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
