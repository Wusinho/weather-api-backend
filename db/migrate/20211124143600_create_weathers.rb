class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.date :date
      t.string :temperature

      t.timestamps
    end
  end
end
