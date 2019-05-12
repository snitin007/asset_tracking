class LastKnownController < ApplicationController 
	def index
		@sensors = Beacon.all
		@locations = Array.new
		unique_ids = @sensors.pluck(:sensor_id).uniq
		unique_ids.each do |id|
			@locations.push(Beacon.find_by(sensor_id: id))
		end
	end
end