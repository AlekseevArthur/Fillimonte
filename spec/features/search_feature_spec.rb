require 'rails_helper'

RSpec.describe 'Search bar', type: :feature do
  let!(:film) { create(:film) }
  let!(:drive) { create(:drive) }

  before do
    visit '/'
    click_on 'Close'
  end

  it 'exists on a main page' do
    expect(page).to have_content('Search')
  end

  it 'dinamically returns all films that match' do
    expect(page).to have_content(drive.name)
    fill_in 'search', with: film.name
    expect(page).to have_content(film.name)
    expect(page).to_not have_content(drive.name)
  end

  it 'returns all films that match after submit' do
    expect(page).to have_content(drive.name)
    fill_in 'search', with: film.name
    click_on 'Search'
    expect(page).to have_content(film.name)
    expect(page).to_not have_content(drive.name)
  end

  it 'show all films if search field is empty' do
    fill_in 'search', with: ''
    expect(page).to have_content(drive.name)
    expect(page).to have_content(film.name)
  end

  it 'saves the query in the field after submit' do
    fill_in 'search', with: 'test'
    click_on 'Search'
    expect(page).to have_current_path("#{current_path}?query=test")
    expect(page).to have_field('search', with: 'test')
  end
end
