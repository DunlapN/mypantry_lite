class AddIngredientCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :ingredients_count, :integer
  end
end
