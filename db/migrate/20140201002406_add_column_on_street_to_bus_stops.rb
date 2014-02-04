class AddColumnOnStreetToBusStops < ActiveRecord::Migration
  def change
    add_column :bus_stops, :on_street, :string
  end
end
