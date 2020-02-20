class Booking < ApplicationRecord
  belongs_to :caddie
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, uniqueness: { scope: :caddie }
  has_many :reviews
  has_many :notifications

  def booking_unread_notifications
    Notification.where(booking: self).where(read_status: false).length
  end

  def booking_notifications
    Notification.where(booking: self).order(:read_status).to_a
  end

end
