require 'rails_helper'

RSpec.describe Film do
  it 'is valid with valid attributes' do
    expect(build(:film)).to be_valid
  end

  it 'is not valid with invalid attributes' do
    expect(build(:invalid_film)).to_not be_valid
  end
end
