require 'rails_helper'

RSpec.describe 'Films', type: :feature do
  let(:film) { create :film }

  it 'shown at root path' do
    film = create(:film)
    expect(Film.count).to eq(1)
    visit '/'
    click_on 'Close'
    expect(page).to have_content(film.name)
  end

  it 'show the film page by clicking on the card' do
    film = create(:film)
    expect(Film.count).to eq(1)
    visit '/'
    click_on 'Close'
    expect(page).to have_content(film.name)
    click_on 'Fight club'
    expect(page).to have_content(film.rating)
    expect(page).to have_content(film.description)
  end

  context 'Welcome modal window' do
    it 'shown on main page if unauth' do
      visit '/'
      expect(page).to have_content('Hello stranger!')
      expect(page).to have_content('You need to log in to access all features.')
    end

    it 'not shown on main page if unauth' do
      sign_in create(:user)
      visit '/'
      expect(page).to_not have_content('Hello stranger!')
      expect(page).to_not have_content('You need to log in to access all features.')
    end
  end
end
