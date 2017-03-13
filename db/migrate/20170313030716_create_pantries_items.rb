class CreatePantriesItems < ActiveRecord::Migration
  def change
    create_table :pantries_items do |t|
      t.integer :user_id
      t.integer :food_id

      t.timestamps

    end
  end
end
