class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new

  end

  def create
    current_order = params[:item][:id]


    @item = Item.new({
            :artical_number => item_params[:number],
            :artical_size => item_params[:size],
            :artical_gender => item_params[:gender],
            :order_number => item_params[:id],
          })

      if @item.save
        flash[:notice] = "Item successfully Added"
        redirect_to edit_order_path(id: item_params[:id].to_i)
      else
        flash[:notice] = "Error"
         flash[:error] = @item.errors.full_messages
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

    @list_items = Item.where(order_number: @order)


  end

  private
    def item_params
      params.require(:item).permit(:number, :size, :gender, :id)
    end


end
