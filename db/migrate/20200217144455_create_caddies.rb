class CreateCaddies < ActiveRecord::Migration[5.2]
  def change
    create_table :caddies do |t|
      t.string :name
      t.string :description
      t.boolean :availability, default: true
      t.string :condition
      t.integer :wheels_number
      t.integer :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
