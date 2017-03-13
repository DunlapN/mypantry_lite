class AddPantriesItemCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pantries_items_count, :integer
  end
end
