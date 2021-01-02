class AddFinalizedToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :finalized, :boolean, default: false
  end
end
