class Booking < ApplicationRecord
  belongs_to :caddie
  belongs_to :user
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user, uniqueness: { scope: :caddie }
end
