require 'csv'

require 'active_record'
require 'activerecord-import'

namespace :db do 
  desc "Fill database with stops on routes" 
  task :populate_stop_on_routes => :environment do
  batch,batch_size = [],500
  columns = [:stop_id, :route]
  CSV.foreach('./lib/sor_data.csv') do |row|
    batch << StopOnRoute.new(stop_id: row[0].to_i, route: row[1])
    if batch.size > batch_size 
      StopOnRoute.import batch
      batch = []
      puts "Successfully imported batch last row was #{row}"
    end
  end   
  StopOnRoute.import batch
end
end