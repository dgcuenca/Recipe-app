require 'rails_helper'
require_relative 'actions_helper_public_recipe'

RSpec.describe RecipeFood, type: :system do
    include ActionsHelperPublicRecipe
    it 'Can see a public recipe' do
      sign_up
      add_recipe
      click_link 'Public Recipes'
      expect(page).to have_content('Feijoada')
    end

  end