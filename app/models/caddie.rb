class Caddie < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  validates :name, presence: true
  validates :condition, presence: true
  validates :wheels_number, presence: true, numericality: { only_integer: true, less_than: 8 }
  validates :capacity, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
