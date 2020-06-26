class RemoveCompletedFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :completed
  end
end
