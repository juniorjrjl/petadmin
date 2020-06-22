class ServiceScheduleJob < ApplicationJob
  queue_as :emails

  def perform(client, title, body)
    ScheduleMailer.notity_client(client, title, body).deliver_now
  end
end
