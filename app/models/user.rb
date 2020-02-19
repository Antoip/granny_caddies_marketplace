class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def rating
    ratings = []
    Caddie.where(user: self).each do |caddy|
      caddy.bookings.each do |booking|
        booking.reviews.each do |review|
          ratings << review.rating
        end
      end
    end
    if ratings.empty?
      return ""
    else
      return [ratings.sum.fdiv(ratings.length).round]
    end
  end
end
