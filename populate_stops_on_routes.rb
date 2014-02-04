require 'csv'

def parse_to_stops(path)
  CSV.foreach(path) do |row|
    final = ""
    routes = row[3]
    id = row[0]
    routes.split(',').each do |route|
      newSOR  =  StopsOnRoutes.new(stop_id: id, route: route) 
      if newSOR.save 
        puts "Added stop on route to database with id: #{id}"
      else
        puts "Failed to add database"
      end
    end
  end
end

parse_to_stops('./CTA_data.csv')
