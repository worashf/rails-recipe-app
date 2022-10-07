require 'rails_helper'

RSpec.describe RecipeFood, type: :method do
  subject do
    user1 = User.create(name: 'abee', email: 'frome@gmail.com', password: 'password', confirmed_at: Time.now)
    recipe1 = Recipe.create(user: user1, name: 'rice jamp recipe', preparation_time: 30, cooking_time: 40)
    food1 = Food.create(name: 'Rice champ', measurment_unit: 'KG', price: 20, user: user1)
    RecipeFood.new(recipe: recipe1, food: food1, quantity: 5)
  end
  before { subject.save }

  it 'recipe should be present' do
    subject.recipe = nil
    expect(subject).to_not be_valid
  end

  it 'food should be present' do
    subject.food = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be equal to or greater than 1' do
    subject.quantity = -2
    expect(subject).to_not be_valid
  end
end
