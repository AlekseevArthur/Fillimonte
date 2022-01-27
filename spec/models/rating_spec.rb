require 'rails_helper'

RSpec.describe 'Rating model', type: :model do
  it 'is valid with valid attrs' do
    expect(create(:rating)).to be_valid
  end

  it 'is not valid with invalid attrs' do
    rating = build(:rating)
    rating.rating = 10
    expect(rating).to_not be_valid
  end
end
