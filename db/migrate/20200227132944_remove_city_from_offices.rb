class RemoveCityFromOffices < ActiveRecord::Migration[5.2]
  def change
    remove_column :offices, :city, :string
  end
end
