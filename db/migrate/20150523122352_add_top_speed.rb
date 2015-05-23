class AddTopSpeed < ActiveRecord::Migration
  def change
    add_column :race_cars, :top_speed, :integer
  end
end
