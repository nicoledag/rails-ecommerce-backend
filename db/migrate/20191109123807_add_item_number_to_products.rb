class AddItemNumberToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :item_number, :string
  end
end
