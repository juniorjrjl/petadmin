module Admin
  class ServiceSchedulesController < Fae::BaseController
    before_action :adjust_enum, only: [:create, :update]

    def adjust_enum
      params[:service_schedule][:status] = params[:service_schedule][:status].to_i
    end
  end
end
