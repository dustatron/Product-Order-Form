class AddOrderNumbersToItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :items, :orders, foreign_key: true
  end
end
