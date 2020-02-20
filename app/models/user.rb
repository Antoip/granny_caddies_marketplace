class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo

  has_many :notifications
  has_many :messages, dependent: :destroy

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
