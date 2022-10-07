FactoryBot.define do
  factory :user do
    email { 'bste@user.com' }
    password { 'qwerty' }
    # Add additional fields as required via your User model
  end
end
