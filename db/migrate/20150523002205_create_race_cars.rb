class CreateRaceCars < ActiveRecord::Migration
  def change
    create_table :race_cars do |t|
      t.integer :start_no
      t.string :class_type
      t.string :make
      t.string :model
      t.integer :year
      t.integer :ccm
      t.integer :hp
      t.integer :votes
      t.text :description

      t.timestamps null: false
    end
    add_attachment :race_cars, :picture
  end
end
