module Admin
  class AddressesController < Fae::ApplicationController
    before_action :set_class_variables
    before_action :set_item, only: [:show, :edit, :update, :destroy]

    layout false, except: :index
    helper Fae::ApplicationHelper

    def new
      @item = Address.new
      @item.client_id = params[:item_id]
    end

    def index
      @items = Address.for_fae_index
    end

    def edit
    end

    def create
      p params
      @item = Address.new(permitted_params)
      p @item
      if @item.save
        @items = Address.for_fae_index
        flash[:notice] = 'Item successfully created.'
        render template: 'admin/addresses/index'
      else
        render action: 'new'
      end
    end

    def update
      if @item.update(permitted_params)
        @items = Address.for_fae_index
        flash[:notice] = 'Item successfully updated.'
        render template: 'admin/addresses/index'
      else
        render action: 'edit'
      end
    end

    def destroy
      if @item.destroy
        flash[:notice] = 'Item successfully removed.'
      else
        flash[:alert] = 'There was a problem removing your item.'
      end
      @items = Address.for_fae_index
      render template: 'admin/addresses/index'
    end

    private

    def set_class_variables(class_name = nil)
      klass_base = params[:controller].split('/').last
      @klass_name = class_name || klass_base              # used in form views
      @klass = klass_base.classify.constantize            # used as class reference in this controller
      @klass_singular = klass_base.singularize            # used in index views
      @klass_humanized = @klass_name.singularize.humanize # used in index views
      @index_path = '/' + params[:controller]             # used in form_header partial
      @new_path = @index_path + '/new'                    # used in index_header partial
    end

    def set_item
      @item = Address.find(params[:id])
    end

    def permitted_params
      params.require(:address).permit!
    end


  end
end
