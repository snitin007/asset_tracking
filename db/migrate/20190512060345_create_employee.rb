class CreateEmployee < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :job
      t.references :beacon, foreign_key: true
    end
  end
end
