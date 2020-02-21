class PagesController < ApplicationController
  def home
  end

  def dashboard
  end

  def notifications
    @notifications = current_user.notifications
  end
end
