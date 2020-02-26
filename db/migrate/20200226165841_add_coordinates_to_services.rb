class AddCoordinatesToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :latitude, :float
    add_column :services, :longitude, :float

    geocoded_by :address
    after_validation :geocode, if: :will_save_change_to_address?
  end
end
