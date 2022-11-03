class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :name, null: false
      t.string :model, null: false
      t.decimal :price_per_day, null: false
      t.string :picture
      t.text :description
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
