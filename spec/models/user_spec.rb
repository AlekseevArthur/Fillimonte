require 'rails_helper'

RSpec.describe User, type: :model do
  it 'works with valid attributes' do
    expect(build(:user)).to be_valid
  end

  it 'dont work with invalid attributes' do
    user = build(:invalid_user)
    expect(user).to_not be_valid
    user.phone = nil
    expect(user).to_not be_valid
    user.phone = '+375291111111'
    expect(user).to be_valid
  end
end