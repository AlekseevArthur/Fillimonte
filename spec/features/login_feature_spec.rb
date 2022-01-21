require 'rails_helper'

RSpec.describe 'Nav', type: :feature do
  it 'has login link if user didnt auth' do
    visit '/'
    expect(page).to have_content('Login')
  end

  it 'has profile name if user auth' do
    sign_in create(:user)
    visit '/'
    expect(page).to have_content('user')
  end
end

RSpec.describe 'User', type: :feature do
  it 'can login' do
    create(:user)
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: 'qwerty@qwerty'
    fill_in 'Password', with: '111111'
    click_on 'Log in'
    expect(page).to have_content('user')
  end

  it 'can visit profile page' do
    sign_in create(:user)
    visit '/user'
    expect(page).to have_content('user')
    expect(page).to have_content('+375291111111')
    expect(page).to have_content('qwerty@qwerty')
  end
end
