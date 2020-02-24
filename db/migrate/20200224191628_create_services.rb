class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.references :user, foreign_key: true
      t.integer :rate
      t.string :title
      t.text :description
      t.integer :years_experience

      t.timestamps
    end
  end
end
