class AddIdToBeacons < ActiveRecord::Migration[5.2]
  def change
    add_column :beacons, :sensor_id, :integer
  end
end
