class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      #shipping information
      t.string :ship_to_street
      t.string :ship_to_city
      t.string :ship_to_state
      t.integer :ship_to_zip

      #item details
      t.string :artical_number
      t.string :artical_size
      t.string :artical_quantity
      t.string :artical_gender
      t.string :artical_division

      #tracking info
      t.string :submitted_by
      t.string :order_number
      t.string :budget_code


      t.timestamps
    end
  end
end
