require 'rails_helper'

RSpec.describe 'Comment model', type: :model do
  it 'is valid with valid attributes' do
    comment = create(:comment)
    expect(comment).to be_valid
  end

  it 'is invalid without user_id' do
    comment = build(:comment)
    comment.user_id = nil
    expect(comment).to_not be_valid
  end

  it 'is invalid without film_id' do
    comment = build(:comment)
    comment.film_id = nil
    expect(comment).to_not be_valid
  end

  it 'is invalid with wrong text' do
    comment = build(:comment)
    comment.text = nil
    expect(comment).to_not be_valid
    comment.text = '11'
    expect(comment).to_not be_valid
    comment.text = '111111111111111111111111111111111111111111111111111111111111'
    expect(comment).to_not be_valid
  end
end
