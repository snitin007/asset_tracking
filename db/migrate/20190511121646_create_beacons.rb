class CreateBeacons < ActiveRecord::Migration[5.2]
  def change
    create_table :beacons do |t|
      t.references :central, foreign_key: true
      t.integer :orientation
      t.integer :distance

      t.timestamps
    end
  end
end
