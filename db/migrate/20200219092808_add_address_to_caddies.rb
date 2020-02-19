class AddAddressToCaddies < ActiveRecord::Migration[5.2]
  def change
    add_column :caddies, :address, :string
  end
end
