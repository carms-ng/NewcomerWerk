class RemoveMessageFromBookings < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :message
  end
end
