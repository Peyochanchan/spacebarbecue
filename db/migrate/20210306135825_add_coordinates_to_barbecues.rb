class AddCoordinatesToBarbecues < ActiveRecord::Migration[6.0]
  def change
    add_column :barbecues, :latitude, :float
    add_column :barbecues, :longitude, :float
  end
end
