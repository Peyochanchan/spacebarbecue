class AddDatesToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :start_time, :date
    add_column :locations, :end_time, :date
  end
end
