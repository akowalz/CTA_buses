class BusStop < ActiveRecord::Base
  has_many :stop_on_routes, foreign_key: "stop_id",
                             primary_key: "stop_id" 

  def self.get_route_detail
    select("*").joins(:stop_on_routes)
  end

  def self.get_stop_counts
    get_route_detail.select("*,count(route) as count")
                    .group("bus_stops.stop_id")
                    .order("count desc")

  end
end





# BusStop 

# stop_id:integer
# cross_street:string
# boardings: float
# alightings:float
# month_beginning: string
# daytype:string 
# loc_lat:float
# loc_long:float
