class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.timestamps
    end
    remove_column :vehicles, :brand
    add_reference :vehicles, :brand, index: true
    add_foreign_key :vehicles, :brands, index: true
  end
end
