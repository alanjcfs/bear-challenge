class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :total_price
      t.integer :num_units
      t.integer :employee_id

      t.timestamps
    end

    add_index :orders, :employee_id
  end
end
