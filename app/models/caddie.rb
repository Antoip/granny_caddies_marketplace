class Caddie < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :users, through: :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
  validates :condition, presence: true
  validates :wheels_number, presence: true, numericality: { only_integer: true, less_than: 8 }
  validates :capacity, presence: true


  validates :price, presence: true, numericality: { greater_than: 0 }
  CONDITIONS = ["1 - It barely rolls anymore",
                "2 - It smells a bit like fish but it is ok",
                "3 - It rolls and that's already a lot",
                "4 - It is a radiant racing caddie"]
  WHEELS_NUMBER = (2..7).to_a
  CAPACITY = (1..20).to_a

  include PgSearch::Model
  multisearchable against: [:name, :description, :address] ,  using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end
