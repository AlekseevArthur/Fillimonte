require 'rails_helper'

RSpec.describe 'Rating', js: true do
  let(:user) { create(:user) }

  it 'showed at film page' do
    film = create(:film)
    sign_in user
    Rating.create(user_id: user.id, film_id: film.id, rating: 5)
    visit '/'
    click_on 'Fight club'
    expect(page).to have_content(5)
  end

  it 'can be created by auth user'

  it 'can be changed by auth user'

  it 'readonly for guests'
end
