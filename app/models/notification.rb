class Notification < ApplicationRecord
  belongs_to :booking

  validates :description, presence: true
end
