class StopOnRoute < ActiveRecord::Base
  has_many :bus_stops, foreign_key: "stop_id",
                       primary_key: "stop_id"
end
