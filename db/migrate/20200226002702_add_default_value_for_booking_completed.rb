class AddDefaultValueForBookingCompleted < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :completed, false
  end
end
