require 'rails_helper'

RSpec.describe 'User', type: :feature do
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

  it 'has modal window on main page if unauth' do
    visit '/'
    expect(page).to have_content('Hello stranger!')
    expect(page).to have_content('You need to log in to access all features.')
  end

  it 'has not modal window on main page if unauth' do
    sign_in create(:user)
    visit '/'
    expect(page).to_not have_content('Hello stranger!')
    expect(page).to_not have_content('You need to log in to access all features.')
  end
end
