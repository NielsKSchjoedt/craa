class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.text :full_name
      t.string :country
      t.references :race_cars, index: true

      t.timestamps null: false
    end
    add_attachment :drivers, :profile_picture
  end
end
