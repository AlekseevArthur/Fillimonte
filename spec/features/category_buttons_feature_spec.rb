require 'rails_helper'

RSpec.describe 'Category buttons', type: :feature do
  let(:user) { create(:user) }
  let(:film) { create(:film) }

  it 'can add film on main page' do
    sign_in user
    film
    visit '/'
    click_on 'watchlater'
    expect(page).to have_content('Added to watchlater')
  end

  it 'can add film on film page' do
    sign_in user
    film
    visit '/'
    click_on 'Fight club'
    click_on 'watchlater'
    expect(page).to have_content('Added to watchlater')
  end

  it 'can add film on main page' do
    sign_in user
    film
    visit '/'
    click_on 'viewed'
    expect(page).to have_content('Added to viewed')
  end

  it 'can add film on film page' do
    sign_in user
    film
    visit '/'
    click_on 'Fight club'
    click_on 'viewed'
    expect(page).to have_content('Added to viewed')
  end
end
