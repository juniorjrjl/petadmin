module Admin
  class DiscountsController < Fae::BaseController
    before_action :config_type, only: [:create, :update]

    def config_type
      params[:discount][:kind] = params[:discount][:kind].to_i
    end

  end
end
