class NotificationsController < ApplicationController


  def update

  end

  def delete

  end

  def update_read_status
    @notification = Notification.find(params[:id])
    if @notification.read_status == false
      @notification.read_status = true
    else
      @notification.read_status = true
    end
    @notification.update({read_status: @notification.read_status})
    redirect_to notifications_path
  end
end
