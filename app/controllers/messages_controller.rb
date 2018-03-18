class MessagesController < ApplicationController
  before_filter :require_login

  def create
    event = Event.find(message_params[:event_id])

    mailer = MessageMailer.send_message(
      event,
      message_params.to_h
    ).deliver_later

    flash[:success] = 'Your message was successfully sent!'

    redirect_to :back
  rescue Exception
    flash[:error] = 'Oops something went wrong!'

    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(
      :event_id,
      :name,
      :email,
      :phone,
      :body
    )
  end
end
