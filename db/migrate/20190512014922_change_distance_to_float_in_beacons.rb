class ChangeDistanceToFloatInBeacons < ActiveRecord::Migration[5.2]
  def change
  	change_column :beacons, :distance, :float
  end
end
