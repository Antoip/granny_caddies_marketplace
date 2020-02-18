class AddPriceToCaddies < ActiveRecord::Migration[5.2]
  def change
    add_column :caddies, :price, :integer
  end
end
