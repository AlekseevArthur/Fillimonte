require 'rails_helper'

RSpec.describe Viewed, type: :model do
  it 'is valid with valid attrs' do
    expect(create(:viewed)).to be_valid
  end

  it 'is not valid with invalid attrs' do
    expect(Viewed.create).to_not be_valid
  end
end
