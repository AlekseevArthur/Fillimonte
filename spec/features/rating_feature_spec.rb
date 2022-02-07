require 'rails_helper'

RSpec.describe 'Rating' do
  let(:user) { create(:user) }
  let!(:film) { create(:film) }

  context 'for logged users' do
    before do
      sign_in user
    end

    it 'is shown on the film page' do
      create :rating, user: user, film: film
      visit "/films/#{film.id}"
      expect(page).to have_content(5)
    end

    it 'can be created by user' do
      visit "/films/#{film.id}"
      expect(page).to have_content('Your Rate')
      find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
      expect(page).to have_content('Create rating - 4')
      expect(page).to have_content(4)
    end

    it 'can be updated by user' do
      create :rating, user: user, film: film
      visit "/films/#{film.id}"
      expect(page).to have_content(5)
      find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
      expect(page).to have_content('Update rating - 3')
    end
  end

  it 'can not be created by unauth' do
    visit "/films/#{film.id}"
    expect(page).to have_content('Your Rate')
    find(:xpath, '/html/body/div[2]/div/div[2]/div[2]/span').click
    expect(page).to_not have_content('Create')
  end
end
