require 'rails_helper'

RSpec.describe Film do
  it 'is valid with valid attributes' do
    expect(build(:film)).to be_valid
  end

  it 'is not valid with invalid attributes' do
    expect(build(:invalid_film)).to_not be_valid
  end
end

RSpec.describe Actor do
  it 'is valid with valid attributes' do
    expect(build(:actor)).to be_valid
  end

  it 'is not valid with invalid attributes' do
    expect(Actor.new({ name: nil, image_url: 123 })).to_not be_valid
  end
end
