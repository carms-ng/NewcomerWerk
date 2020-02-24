class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start
      t.datetime :end
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true
      t.string :status
      t.boolean :completed
      t.text :message

      t.timestamps
    end
  end
end
