class RemoveTimeColumnsFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :preparation_time
    remove_column :recipes, :cooking_time
  end
end
