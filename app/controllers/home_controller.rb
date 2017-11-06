class HomeController < ApplicationController

  before_action :authenticate_user!


  def index
    @order = Order.where(user_id: current_user.id)

  end


  def create
    name = current_user.email

    #order_number =  Order.count.to_s + "-" + DateTime.now.strftime('%m/%d/%Y').to_s
    random_number = rand(1000..9999)
    order_number = ((Order.count) +1 ).to_s + "-" + current_user.id.to_s + "-" +random_number.to_s

    @order = Order.new({
            :user_id => current_user.id,
            :name => name,
            :order_numbers => order_number,
          })

    if @order.save
      flash[:notice] = "Order successfully created"
      redirect_to new_order_path(order: order_number)
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

  private

def set_access_token
  self.access_token = generate_token
end

def generate_token
  loop do
    token = SecureRandom.hex(10)
    break token unless User.where(access_token: token).exists?
  end
end


end
