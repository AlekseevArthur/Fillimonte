FactoryBot.define do
  factory :comment do
    user
    film
    text { 'despacito' }
  end
end
