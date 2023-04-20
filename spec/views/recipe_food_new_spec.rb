require 'rails_helper'
require_relative 'actions_helper_food_recipe'

RSpec.describe RecipeFood, type: :system do
    include ActionsHelperRecipeFood
    it 'Can see the recipes title' do
      sign_up
      click_link 'Recipes'
      expect(page).to have_content('Recipes')
    end

  end