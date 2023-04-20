require 'rails_helper'
require_relative 'actions_helper_food'

RSpec.describe Food, type: :system do
  include ActionsHelperFood
  it 'Can see the  new foods title' do
    sign_up
    click_link 'Add food'
    expect(page).to have_content('New Food')
  end

  it 'Can see foods when I add a food' do
    sign_up
    add_food
    visit foods_path
    expect(page).to have_content('Pizza')
  end

end