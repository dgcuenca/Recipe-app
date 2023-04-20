require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Food, type: :system do
    include ActionsHelperRecipe
    it 'Can see the recipes title' do
      sign_up
      click_link 'Recipes'
      expect(page).to have_content('Recipes')
    end
  
    it 'Can see No recipess when it is empty' do
      sign_up
      click_link 'Recipes'
      expect(page).to have_content('There are no recipes yet')
    end
  
    it 'Clicking on New Recipe should redirects to new recipe page' do
      sign_up
      click_link 'Recipes'
      click_link 'New Recipe'
      expect(page).to have_current_path(new_recipe_path)
    end
  
    it 'Can see recipes when I add a recipe' do
        sign_up
        add_recipe
        visit recipes_path
        expect(page).to have_content('Feijoada')
    end
  
  end