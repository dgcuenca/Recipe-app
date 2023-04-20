require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    User.create(name: 'Belay', email: 'borntodie2129@gmail.com', password: '123456')
  end

  before(:each) do
    @recipe = Recipe.new(user_id: subject.id, name: 'Pizza', description: 'Description for preparing pizza', preparation_time: 25,
                         cooking_time: 25, public: false)
  end

  context 'Testing validations' do
    it 'Should be valid' do
      expect(@recipe).to be_valid
    end

    it 'Recipe should have a name' do
      expect(@recipe.name).to be_present
    end

    it 'Recipe should have a description' do
      expect(@recipe.description).to be_present
    end

    it 'Recipe should have a preparation_time' do
      expect(@recipe.preparation_time).to be_present
    end

    it 'Recipe should have a positive preparation_time' do
      expect(@recipe.preparation_time).to be >= 0
    end

    it 'Recipe preparation time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a cooking_time' do
      expect(@recipe.cooking_time).to be_present
    end

    it 'Recipe should have a valid cooking_time' do
      expect(@recipe.cooking_time).to be >= 0
    end

    it 'Recipe cooking time should be numeric' do
      expect(@recipe.preparation_time).to be_a_kind_of(Numeric)
    end

    it 'Recipe should have a user_id' do
      expect(@recipe.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Recipe should belong to a user' do
      @recipe = Recipe.reflect_on_association(:user)
      expect(@recipe.macro).to eq(:belongs_to)
    end

    it 'Recipe should have many recipe foods' do
      @recipe = Recipe.reflect_on_association(:recipe_foods)
      expect(@recipe.macro).to eq(:has_many)
    end
  end
end