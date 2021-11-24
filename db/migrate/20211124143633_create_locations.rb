class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.integer :lat
      t.integer :lon
      t.string :city
      t.string :state
      t.references :weather, null: false, foreign_key: true

      t.timestamps
    end
  end
end
