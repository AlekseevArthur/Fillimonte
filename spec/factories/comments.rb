FactoryBot.define do
  factory :comment do
    user
    film
    text { 'Very good film im told ya!' }
  end
end
