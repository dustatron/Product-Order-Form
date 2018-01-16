class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = params[:order_id]
    @order_object = Order.find(params[:order_id])
    @user = User.find_by_id(@order_object.user_id)

  end

  def add_item
    @order = Order.find(params[:id])
    name = current_user.email

    @iten = Item.new({
            :artical_number=> artical_number,
            :artical_size => artical_size,
            :artical_gender => artical_gender,
            :order_number => order,
            :orders_id => orders_id,
          })

    if @order.save
      flash[:notice] = "Order successfully created"
      redirect_to new_order_path(order_id: @order.id)
    else
       flash[:notice] = "There was an error"
       redirect_to root_path
    end
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


end
