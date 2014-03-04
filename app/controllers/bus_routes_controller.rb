class BusRoutesController < ApplicationController
  def show
    @bus_stops = all_stops(params[:id])
    @bus_stops_paginated = @bus_stops.paginate(page: params[:page],
                                               per_page: 10)
                                    
    @boardings = total_boardings @bus_stops
    @alightings = total_alightings @bus_stops
    @street = get_representative_street params[:id]



   
  end

  def index
    @routes = StopOnRoute.select("COUNT(stop_id) as num_stops, route")
                          .group("route").order("num_stops desc")
                          .paginate(page: params[:page])

    # the number of stops that represent 50% of the total boardings
    # divided by number of stops on the route


  end

  private 

    def all_stops(route_id)
      BusStop.get_route_detail
             .where("stop_on_routes.route = ?",route_id)
             .order("boardings desc")
    end

    def total_boardings(stops)
      stops.sum('boardings')
    end

    def total_alightings(stops)
      stops.sum('alightings')
    end

    def get_representative_street(route_id)
      all_stops(route_id).select("count(on_street) as count,on_street")
                         .group("on_street").order("count desc")
                         .limit(1).first.on_street.titlecase
    end
end
