class AddStockStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :in_stock, :string, default: "yes"
  end
end
