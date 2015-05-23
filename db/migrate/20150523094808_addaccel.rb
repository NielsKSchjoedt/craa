class Addaccel < ActiveRecord::Migration
  def change
    add_column :race_cars, :acceleration, :decimal, :precision => 8, :scale => 1
  end
end
