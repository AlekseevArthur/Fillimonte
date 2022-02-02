require 'rails_helper'

RSpec.describe 'Comments', type: :feature do
  let(:film) { create(:film) }
  let(:user) { create(:user) }

  context 'An authorized user' do
    it 'can add comment' do
      film
      sign_in user
      visit "/films/#{film.id}"
      fill_in 'text', with: 'despacito'
      click_on 'Submit'
      expect(page).to have_text('despacito')
    end

    it 'can delete own comment' do
      film
      sign_in user
      visit "/films/#{film.id}"
      fill_in 'text', with: 'despacito'
      click_on 'Submit'
      click_on 'x'
      expect(page).not_to have_text('despacito')
    end

    it 'can\'t delete another\'s comment' do
      create(:comment)
      sign_in create(:tony_hawk)
      visit "/films/#{Film.first.id}"
      expect(page).to have_text('despacito')
      expect(page).not_to have_content('x')
    end
  end
end