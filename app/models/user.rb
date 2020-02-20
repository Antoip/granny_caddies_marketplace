class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  has_many :bookings
  has_many :notifications, through: :bookings

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

  def count_unread_notifications
    count = 0
    Booking.where(user: self).each do |booking|
      count += booking.booking_unread_notifications
    end
    count
  end

  def notifications
    notifications = []
    Booking.where(user: self).each do |booking|
      unless booking.booking_notifications.empty?
        booking.booking_notifications.each do |notification|
          notifications << notification
        end
      end
    end
    Caddie.where(user:self).each do |caddie|
      unless caddie.caddie_notifications.empty?
        caddie.caddie_notifications.each do |notification|
          notifications << notification
        end
      end
    end
    notifications
  end

  def friends
    friends = Message.where(sender: self).map { |message| message.receiver} + Message.where(receiver: self).map { |message| message.sender}
    friends.uniq
  end

  def conversation_with(friend_id)
    friend       = User.find(friend_id)
    conversation = Message.where(sender: self, receiver: friend) + Message.where(sender: friend, receiver: self)
    conversation.sort_by { |message| message.created_at }
  end
end
