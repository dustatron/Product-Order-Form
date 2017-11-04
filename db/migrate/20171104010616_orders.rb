class Orders < ActiveRecord::Migration[5.1]
  def change
      create_table :orders do |t|
        t.string :name
        t.string :order_numbers

        t.timestamps null: false
      end
  end
end
