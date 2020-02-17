class Booking < ApplicationRecord
  belongs_to :caddie
  belongs_to :user
end
