json.extract! beacon, :id, :orientation, :distance, :updated_at, :created_at, :sensor_id
json.url central_beacons_path(beacon, format: :json)
