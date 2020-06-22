class ScheduleMailer < ApplicationMailer

  def notity_client(client, title, body)
    @body = body
    mail to: client, subject: title
  end
end
