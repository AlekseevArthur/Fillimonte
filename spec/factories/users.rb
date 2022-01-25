FactoryBot.define do
  factory :user do
    email                 { 'qwerty@qwerty.com' }
    password              { '111111' }
    password_confirmation { '111111' }
    name { 'user' }
    phone { '+375291111111' }
  end

  factory :invalid_user, parent: :user do
    phone { 'dffdg12345' }
  end
end
