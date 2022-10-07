require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    user1 = User.create(name: 'Worash', email: 'worash@gmail.com', password: 'password', confirmed_at: Time.now)
    Food.new(name: 'Rice champ', measurment_unit: 'KG', price: 20, user: user1)
  end

  before { subject.save }

  it 'Food name should present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'hould be an instance of food ' do
    expect(subject).to be_instance_of(Food)
  end
  it 'Food does not user should be invalid' do
    subject.user = nil
    expect(subject).to be_invalid
  end
  it 'measurment_unit should be present' do
    subject.measurment_unit = nil
    expect(subject).to_not be_valid
  end

  it 'user should be present' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'price should be equal to or greater than 1' do
    subject.price = -2
    expect(subject).to_not be_valid
  end
end
