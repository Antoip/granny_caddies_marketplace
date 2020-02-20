class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.text :description
      t.boolean :read_status, default: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
