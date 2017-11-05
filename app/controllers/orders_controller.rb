class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.where(user_id: current_user.id)

  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path , :notice => "Order Deleted"
  end


end
