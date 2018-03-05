class MessagesController < ApplicationController
  before_filter :require_login

  def create
    ContactFormMailer.send(params).deliver

    flash[:success] = "Your message was successfully sent!"

    redirect_to :back
  end
end
