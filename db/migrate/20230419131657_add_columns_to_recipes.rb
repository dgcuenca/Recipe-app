class AddColumnsToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :preparation_time, :decimal, precision: 10, scale: 2
    add_column :recipes, :cooking_time, :decimal, precision: 10, scale: 2
  end
end
