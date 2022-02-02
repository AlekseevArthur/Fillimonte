require 'rails_helper'

RSpec.describe 'Category panel', type: :feature do
  let(:user) { create(:user) }
  let(:film) { create(:film) }
  let(:watchlater) { build(:watchlater) }
  let(:viewed) { build(:viewed) }

  it 'show watchlater films' do
    sign_in user
    film
    Watchlater.create(user_id: user.id, film_id: film.id)
    visit '/user'
    expect(page).to have_content(film.name)
  end

  it 'show viewed films' do
    sign_in user
    film
    Viewed.create(user_id: user.id, film_id: film.id)
    visit '/user'
    find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
    expect(page).to have_content(film.name)
  end

  it 'can change wl to vd' do
    sign_in user
    film
    Watchlater.create(user_id: user.id, film_id: film.id)
    visit '/user'
    expect(page).to have_content(film.name)
    click_on 'changeCategory'
    expect(page).to have_content('Added to viewed')
    expect(page).not_to have_content(film.name)
    find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
    expect(page).to have_content(film.name)
  end

  it 'can change vd to wl' do
    sign_in user
    film
    Viewed.create(user_id: user.id, film_id: film.id)
    visit '/user'
    find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
    expect(page).to have_content(film.name)
    click_on 'changeCategory'
    expect(page).to have_content('Added to watchlater')
    expect(page).not_to have_content(film.name)
    find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[1]').click
    expect(page).to have_content(film.name)
  end

  it 'can delete wl film' do
    sign_in user
    film
    Watchlater.create(user_id: user.id, film_id: film.id)
    visit '/user'
    expect(page).to have_content(film.name)
    click_on 'deleteBtn'
    expect(page).to have_content('Delete from category')
    click_on 'deleteModalBtn'
    expect(page).to have_content('Deleted')
    expect(page).not_to have_content(film.name)
  end

  it 'can delete vd film' do
    sign_in user
    film
    Viewed.create(user_id: user.id, film_id: film.id)
    visit '/user'
    find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
    expect(page).to have_content(film.name)
    click_on 'deleteBtn'
    expect(page).to have_content('Delete from category')
    click_on 'deleteModalBtn'
    expect(page).to have_content('Deleted')
    expect(page).not_to have_content(film.name)
  end
end
