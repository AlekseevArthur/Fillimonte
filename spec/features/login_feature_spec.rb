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
