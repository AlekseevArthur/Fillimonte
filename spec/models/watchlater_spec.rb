require 'rails_helper'

RSpec.describe 'Watchlater model', type: :model do
  it 'is valid with valid attrs' do
    expect(create(:watchlater)).to be_valid
  end

  it 'is not valid with invalid attrs' do
    expect(Watchlater.create).to_not be_valid
  end
end
