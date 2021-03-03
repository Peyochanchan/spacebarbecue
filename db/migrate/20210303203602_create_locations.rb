class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :barbecue, null: false, foreign_key: true

      t.timestamps

    end
  end
end
