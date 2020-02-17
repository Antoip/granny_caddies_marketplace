class Caddie < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :availability, presence: true
  validates :condition, presence: true
  validates :wheels_number, presence: true, numericality: { only_integer: true }
  validates :capacity, presence: true
end
