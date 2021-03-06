class AddColumnToBarbecues < ActiveRecord::Migration[6.0]
  def change
    add_column :barbecues, :address, :string, null: false
  end
end
