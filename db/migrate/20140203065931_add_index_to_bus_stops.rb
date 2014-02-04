class AddIndexToBusStops < ActiveRecord::Migration
  def change
    add_index :bus_stops, :stop_id
    add_index :stop_on_routes, :route
  end
end
