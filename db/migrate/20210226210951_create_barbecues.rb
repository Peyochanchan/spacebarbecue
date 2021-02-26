class CreateBarbecues < ActiveRecord::Migration[6.0]
  def change
    create_table :barbecues do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
