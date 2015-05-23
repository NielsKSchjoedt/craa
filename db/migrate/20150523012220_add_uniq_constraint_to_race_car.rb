class AddUniqConstraintToRaceCar < ActiveRecord::Migration
  def change
    add_index :race_cars, :start_no, unique: true
    rename_column :drivers, :race_cars_id, :race_car_id
    add_foreign_key :drivers, :race_cars
  end
end
