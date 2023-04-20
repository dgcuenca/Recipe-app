require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Recipe, type: :system do
  include ActionsHelperRecipe
  it 'Can see the recipes title' do
    sign_up
    add_recipe
    visit recipes_path
    click_link 'Feijoada'
    expect(page).to have_content('Feijoada preparation process...')
  end
end
