require 'rails_helper'

RSpec.describe 'Rating', js: true do
  let(:user) { create(:user) }
  let(:film) { create(:film) }
  it 'showed at film page' do
    film
    sign_in user
    Rating.create(user_id: user.id, film_id: film.id, rating: 5)
    visit '/'
    click_on 'Fight club'
    expect(page).to have_content(5)
  end

  it 'can be created by user' do
    film
    sign_in user
    visit "/films/#{film.id}"
    expect(page).to have_content('Your Rate')
    find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
    expect(page).to have_content('Create rating - 4')
    expect(page).to have_content(4)
  end

  it 'can be updated by user' do
    film
    sign_in user
    Rating.create(user_id: user.id, film_id: film.id, rating: 5)
    visit "/films/#{film.id}"
    expect(page).to have_content(5)
    find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
    expect(page).to have_content('Update rating - 3')
  end

  it 'can not be created by unauth' do
    film
    visit "/films/#{film.id}"
    expect(page).to have_content('Your Rate')
    find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
    expect(page).to_not have_content('Create')
  end
end
