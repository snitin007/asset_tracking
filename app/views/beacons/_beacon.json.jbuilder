json.extract! beacon, :id, :orientation, :distance, :updated_at, :created_at
json.url central_beacons_path(beacon, format: :json)
