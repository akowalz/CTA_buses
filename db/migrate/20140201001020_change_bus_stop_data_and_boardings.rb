class ChangeBusStopDataAndBoardings < ActiveRecord::Migration
  def change
    change_column :bus_stops, :boardings, :float
    change_column :bus_stops, :month_beginning, :string
  end
end
