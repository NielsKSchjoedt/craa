class AddDefaultValueToVotes < ActiveRecord::Migration
  def change
    change_column :race_cars, :votes, :integer, default: 0
  end
end
