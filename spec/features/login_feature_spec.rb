require 'rails_helper'

RSpec.describe 'Nav', type: :feature do
  it 'has login link if user didnt auth' do
    visit '/'
    expect(page).to have_content('Login')
  end

  it 'has profile name if user auth' do
    visit '/'
    user = create(:user)
    sign_in user
    expect(page).to have_content(user.name)
  end
end
