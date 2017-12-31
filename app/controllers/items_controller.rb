class ItemsController < ApplicationController

  def show

  end

  def create
    order_number = params(:id)
    @item = Item.new(params_items)

    if @item.save
      flash[:success] = "Item Saved."
      redirect_to root_path
    else
      flash[:danger] = "Error Occured. Item not saved."
    end
  end

  def edit
    order_number = params(:id)
    @item = Item.where(id: order_number)
  end

  private
    def params_items
      params.require(:item).permit(:artical_number, :artical_size, :artical_gender)
    end
end
