FactoryBot.define do
  factory :film do
    name { 'Fight club' }
    genre { 'Drama' }
    release_date { '2000.01.01' }
    description { 'The philosofic drama baut shizo who had imagine friend and fund a terroristic group' }
    image_url { 'assets/Fight_Club_poster.jpg' }
    director { 'Carantino Tventin' }
    trailer { 'https://www.youtube.com/embed/qtRKdVHc-cE' }
    rating { '6+' }
  end

  factory :invalid_film, parent: :film do
    name { 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' }
    genre { nil }
    release_date { '553453dfdfd' }
    description { 123 }
    image_url { '1.txt' }
  end

  factory :drive, parent: :film do
    name { 'Drive' }
  end
end
