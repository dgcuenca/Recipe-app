module ActionsHelperPublicRecipe
  def sign_up
    visit new_user_registration_path
    fill_in 'user_name', with: 'Belay', id: 'user_name'
    fill_in 'user_email', with: '2bela@gmail.com', id: 'user_email'
    fill_in 'user_password', with: '123456', id: 'user_password'
    fill_in 'user_password_confirmation', with: '123456', id: 'user_password_confirmation'
    click_button 'Sign up'
  end

  def add_recipe
    visit new_recipe_path
    fill_in 'recipe_name', with: 'Feijoada', id: 'recipe_name'
    fill_in 'recipe_preparation_time', with: '1', id: 'recipe_preparation_time'
    fill_in 'recipe_cooking_time', with: '2', id: 'recipe_cooking_time'
    fill_in 'recipe_description', with: 'Feijoada preparation process...', id: 'recipe_description'
    check('recipe_public')
    click_button 'Create Recipe'
  end
end
