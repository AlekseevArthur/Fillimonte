FactoryBot.define do
  factory :rating do
    film
    user
    rating { 5 }
  end
end
