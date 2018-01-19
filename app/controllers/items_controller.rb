class ItemsController < ApplicationController

  def index

  end

  def show
    @order = params[:id]
    redirect_to edit_order_path(id: @order)
  end

  def new
    @current_order = params[:id]

    @item = Item.new({
            :artical_number => "name",
            :artical_size => "size",
            :artical_gender => "gender",
            :order_number => @current_order,
          })

      if @item.save
        flash[:notice] = "Irder successfully created"
        redirect_to edit_order_path(id: @current_order)
      else
         flash[:notice] = "There was an error"
         redirect_to root_path
       end
  end

  def create

  end

  def edit

  end

  def destroy
  end

  private
    def params_items
      params.require(:item).permit(:number, :size, :gender)
    end
end
