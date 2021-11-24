class CreateTemperatures < ActiveRecord::Migration[6.1]
  def change
    create_table :temperatures do |t|
      t.references :weather, null: false, foreign_key: true
      t.float :temperature

      t.timestamps
    end
  end
end
