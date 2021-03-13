class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :license_plate
      t.string :brand
      t.string :serial_number
      t.integer :tax_horsepower

      t.timestamps
    end
  end
end
