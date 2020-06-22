class AddTypeToDiscounts < ActiveRecord::Migration[5.0]
  def change
    add_column :discounts, :kind, :integer, {:default => 0}
  end
end
