class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new

  end

  def create
    redirect_to root_path
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path , :notice => "Order Deleted"
  end

  def edit
    @order = Order.find(params[:id])
    @order_object = Order.find(params[:id])
    @user = User.find_by_id(@order_object.user_id)

  end

  private
    def params_items
      params.require(:item).permit(:number, :size, :gender)
    end


end
