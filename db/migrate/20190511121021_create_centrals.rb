class CreateCentrals < ActiveRecord::Migration[5.2]
  def change
    create_table :centrals do |t|
      t.integer :room_id
      t.string :room_name
      t.timestamps
    end
  end
end
