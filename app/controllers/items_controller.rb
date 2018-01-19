class ItemsController < ApplicationController

  def index

  end

  def show
    @order = params[:id]
    redirect_to edit_order_path(id: @order)
  end

  def new
    @order = params[:id]
    redirect_to root_path
  end

  def create

  end

  def edit

  end

  def destroy
  end

  private
    def params_items
      params.require(:item).permit(:artical_number, :artical_size, :artical_gender)
    end
end
