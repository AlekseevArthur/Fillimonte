require 'rails_helper'

RSpec.describe 'Nav', type: :feature do
  let(:user) { create(:user) }
  it 'has login link if user didnt auth' do
    visit '/'
    expect(page).to have_content('Login')
  end

  it 'has profile name if user auth' do
    sign_in user
    visit '/'
    expect(page).to have_content(user.name)
  end
end

RSpec.describe 'User', type: :feature do
  let(:user) { create(:user) }
  it 'can login' do
    user
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: '111111'
    click_on 'Submit'
    expect(page).to have_content(user.name)
  end

  it 'can visit profile page' do
    sign_in user
    visit '/user'
    expect(page).to have_content(user.name)
    expect(page).to have_content('+375291111111')
  end
end
