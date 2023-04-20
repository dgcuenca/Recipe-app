require 'rails_helper'
require_relative 'actions_helper_food_recipe'

RSpec.describe RecipeFood, type: :system do
    include ActionsHelperRecipeFood
    it 'Can see food available to be added in recipe' do
      sign_up
      add_food
      add_recipe
      click_link 'Recipes'
      click_link 'Feijoada'
      click_link 'Add ingredient'
      expect(page).to have_content('Pizza')
    end

  end