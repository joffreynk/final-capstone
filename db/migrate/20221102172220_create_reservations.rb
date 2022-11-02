class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :return_date, null: false
      t.date :reservation_date, null: false
      t.string :city, null: false
      t.decimal :total_fee, null: false
      t.references :user, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
