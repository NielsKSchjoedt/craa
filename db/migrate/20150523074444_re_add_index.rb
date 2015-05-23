class ReAddIndex < ActiveRecord::Migration
  def change
    remove_index :race_cars, :start_no
    add_index :race_cars, [:class_type, :start_no], unique: true
  end
end
