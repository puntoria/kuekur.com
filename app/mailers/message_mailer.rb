class MessageMailer < ApplicationMailer
  def send_message(event, params)
    @approver = event.user
    @sender   = params

    mail(
      to: @approver.email,
      from: @sender[:email],
      subject: "New message from: #{@sender[:name]}"
    )
  end
end
