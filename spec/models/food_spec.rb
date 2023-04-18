require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    User.create(name: 'belay', email: '2belamit@gmail.com', password: '123456')
  end

  before(:each) do
    @food = Food.new(name: 'Pitzza', measurement_unit: 'kilogram', price: 12, quantity: 2, user_id: subject.id)
  end

  context 'Testing validations' do
    it 'Validation should be successful' do
      expect(@food).to be_valid
    end

    it 'Should have a name' do
      expect(@food.name).to be_present
    end

    it 'Should have a measurement unit' do
      expect(@food.measurement_unit).to be_present
    end

    it 'Should have a price' do
      expect(@food.price).to be_present
    end

    it 'Should have a valid price' do
      expect(@food.price).to be >= 0
    end

    it 'Food price should be numeric' do
      expect(@food.price).to be_a_kind_of(Numeric)
    end

    it 'Should have a quantity' do
      expect(@food.quantity).to be_present
    end

    it 'Food quantity should be numeric' do
      expect(@food.quantity).to be_a_kind_of(Numeric)
    end

    it 'Should have a valid quantity' do
      expect(@food.quantity).to be >= 0
    end

    it 'Should have a user id' do
      expect(@food.user_id).to be_present
    end
  end

  context 'Testing associations' do
    it 'Should belong to a user' do
      @food = Food.reflect_on_association(:user)
      expect(@food.macro).to eq(:belongs_to)
    end

    it 'Should have many recipe items' do
      @food = Food.reflect_on_association(:recipe_foods)
      expect(@food.macro).to eq(:has_many)
    end
  end
end
