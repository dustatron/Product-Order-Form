class Artical

  def initialize order
    @order_to_search = order
  end

  def any?
    @order_to_search != nil
  end

  def count
    Item.where(order_number: @order_to_search).length
  end

  def list
    Item.where(order_number: @order_to_search).map do |i|
      Item.new({
          artical_gender: i['artical_gender'],
          artical_number: i['artical_number'],
          artical_size: i['artical_size'],
          id: i['id'],
        })
    end
  end

end
