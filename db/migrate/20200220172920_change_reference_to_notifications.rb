class ChangeReferenceToNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_reference :notifications, :user
    add_reference :notifications, :booking
  end
end
