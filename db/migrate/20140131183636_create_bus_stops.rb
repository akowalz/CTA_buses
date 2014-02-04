class CreateBusStops < ActiveRecord::Migration
  def change
    create_table :bus_stops do |t|
      t.integer :stop_id
      t.string :cross_street
      t.integer :boardings
      t.float :alightings
      t.datetime :month_beginning
      t.string :daytype
      t.float :loc_lat
      t.float :loc_long

      t.timestamps
    end
    add_index :bus_stops, :stop_id
  end
end
