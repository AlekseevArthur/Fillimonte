FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password              { '111111' }
    password_confirmation { '111111' }
    name { Faker::Name.name }
    phone { '+375291111111' }
  end

  factory :invalid_user, parent: :user do
    phone { 'dffdg12345' }
  end
end
