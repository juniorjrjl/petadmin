class ServiceSchedule < ApplicationRecord
  include Fae::BaseModelConcern

  after_save :notify

  def fae_display_field
    date  
  end

  def self.for_fae_index
    order(:date)
  end

  belongs_to :client
  belongs_to :service

  def notify
    ServiceScheduleJob.perform_later self.client.email, 
      "Serviço #{self.service.title} agendado", 
      "Prezado #{self.client.name} o serviço #{self.service.title} foi agendado para #{self.date}"
  end

end
