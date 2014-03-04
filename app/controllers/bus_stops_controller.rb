class BusStopsController < ApplicationController
  def index
    @bus_stops = BusStop.all.paginate(page: params[:page])

  end

  def show
    @stop = BusStop.find_by(stop_id: params[:id])
    @routes = StopOnRoute.where('stop_id = ?', params[:id])
  end

  def stopcounts
      @bus_stops = BusStop.get_stop_counts                  
                          .paginate(page: params[:page])                  

  end

end

