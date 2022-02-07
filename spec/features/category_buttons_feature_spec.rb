require 'rails_helper'

RSpec.describe 'Category buttons', type: :feature do
  let(:user) { create(:user) }
  let!(:film) { create(:film) }

  before { sign_in user }

  context 'on the main page' do
    before { visit root_path }

    it 'can add film to watchlater list' do
      click_on 'watchlater'
      expect(page).to have_content('Added to watchlater')
    end

    it 'can add film to vd' do
      click_on 'viewed'
      expect(page).to have_content('Added to viewed')
    end
  end

  context 'on the film page' do
    before { visit "/films/#{film.id}" }

    it 'can add film to watchlater list on the film page' do
      click_on 'watchlater'
      expect(page).to have_content('Added to watchlater')
    end

    it 'can add film to vd on the film page' do
      click_on 'viewed'
      expect(page).to have_content('Added to viewed')
    end
  end
end
