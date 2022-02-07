require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  let(:user) { create(:user) }
  let!(:film) { create(:film) }

  before do
    sign_in user
    visit user_path
  end

  context 'Watchlater' do
    let!(:watchlater) { create :watchlater, user: user, film: film }

    it 'show films' do
      expect(page).to have_content(film.name)
    end

    it 'can change to viewed category' do
      expect(page).to have_content(film.name)
      click_on 'changeCategory'
      expect(page).to have_content('Added to viewed')
      expect(page).not_to have_content(film.name)
      find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
      expect(page).to have_content(film.name)
    end

    it 'can delete watchlater film' do
      expect(page).to have_content(film.name)
      click_on 'deleteBtn'
      expect(page).to have_content('Delete from category')
      click_on 'deleteModalBtn'
      expect(page).to have_content('Deleted')
      expect(page).not_to have_content(film.name)
    end
  end

  context 'Viewed' do
    let!(:viewed) { create :viewed, user: user, film: film }

    it 'can delete viewed film' do
      find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
      expect(page).to have_content(film.name)
      click_on 'deleteBtn'
      expect(page).to have_content('Delete from category')
      click_on 'deleteModalBtn'
      expect(page).to have_content('Deleted')
      expect(page).not_to have_content(film.name)
    end

    it 'can change viewed to watchlater' do
      find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
      expect(page).to have_content(film.name)
      click_on 'changeCategory'
      expect(page).to have_content('Added to watchlater')
      expect(page).not_to have_content(film.name)
      find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[1]').click
      expect(page).to have_content(film.name)
    end

    it 'show viewed films' do
      find(:xpath, '/html/body/div[2]/div/div[1]/div[2]/div/ul/li[2]').click
      expect(page).to have_content(film.name)
    end
  end
end
