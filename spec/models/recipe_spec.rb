require 'rails_helper'

RSpec.describe Recipe, type: :method do
  subject do
    user1 = User.create(name: 'Worash', email: 'worash@gmail.com', password: 'password', confirmed_at: Time.now)
    Recipe.new(user: user1, name: 'rice jamp recipe', preparation_time: 30, cooking_time: 40, public: true)
  end
  before { subject.save }

  it 'Recipe should be present ' do
    subject.user = nil
    expect(subject).to_not be_valid
  end
  it 'subject  should be an instance of Recipe' do
    expect(subject).to be_instance_of(Recipe)
  end
  it 'Recipe should have name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'Recipe preparation time should be numeric' do
    subject.preparation_time = '30'
    expect(subject).to_not be_valid
  end
  it 'Recipe cooking time should be numeric' do
    subject.cooking_time = '30'
    expect(subject).to_not be_valid
  end
end
