class RemoveForeignKeyFromRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    remove_index :user_id, name: "index_recipe_foods_on_user_id"
  end
end
