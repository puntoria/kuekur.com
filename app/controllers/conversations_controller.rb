class ConversationsController < ApplicationController
  before_filter :require_login

  def new
  end

  def create
    recipient =
    current_user.send_message(
      recipient,
      conversation_params[:body],
      conversation_params[:name]).conversation

    flash[:success] = "Your message was successfully sent!"

    redirect_to :back
  end

  private

  def find_recipient
    User.find(params[:user_id])
  end

  def conversation_params
    params.require(:conversation).permit(:name, :email, :phone, :body)
  end
end
