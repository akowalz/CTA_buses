require 'csv'

require 'active_record'
require 'activerecord-import'

namespace :db do 
  desc "Fill database with stops on routes" 
  task :populate_bus_stops => :environment do
  batch,batch_size = [],500
  CSV.foreach('./lib/bus_stop_data.csv') do |row|
    batch << BusStop.new( stop_id: row[0].to_i,
                          on_street: row[1],
                          cross_street: row[2],
                          boardings: row[3].to_f,
                          alightings: row[4].to_f,
                          month_beginning: row[5],
                          daytype: row[6],
                          loc_lat: row[7].to_f,
                          loc_long: row[8].to_f)
    if batch.size > batch_size 
      BusStop.import batch
      batch = []
      puts "Successfully imported batch last row was #{row}"
    end
  end   
  BusStop.import batch
end
end
