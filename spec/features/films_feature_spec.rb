require 'rails_helper'

RSpec.describe 'Simple user', type: :feature do
  it 'can visit main page and see added films' do
    film = create(:film)
    expect(Film.count).to eq(1)
    visit '/'
    click_on 'Close'
    expect(page).to have_content(film.name)
  end

  it 'can click on card' do
    film = create(:film)
    expect(Film.count).to eq(1)
    visit '/'
    click_on 'Close'
    expect(page).to have_content(film.name)
    click_on 'Fight club'
    expect(page).to have_content(film.rating)
    expect(page).to have_content(film.description)
  end
end
