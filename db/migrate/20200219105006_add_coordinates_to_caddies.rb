class AddCoordinatesToCaddies < ActiveRecord::Migration[5.2]
  def change
    add_column :caddies, :latitude, :float
    add_column :caddies, :longitude, :float
  end
end
