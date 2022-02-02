require 'rails_helper'

RSpec.describe 'Comments requests', type: :request do
  let(:film) { create(:film) }
  let(:user) { create(:user) }

  context 'from unauth user' do
    it 'should not add comment' do
      film
      post "/films/#{Film.first.id}/comments", params: { comment: '123' }
      expect(Comment.count).to eq(0)
    end
  end

  context 'from authorized user' do
    it 'should add comment' do
      sign_in user
      film
      expect(Comment.count).to eq(0)
      post "/films/#{Film.first.id}/comments", params: { comment: '123' }
      expect(Comment.count).to eq(1)
      expect(Comment.first).to_not eq(nil)
    end

    it 'should delete own comment' do
      sign_in user
      film
      comment = Comment.create({ user_id: user.id, film_id: film.id, text: '12323' })
      expect(Comment.count).to eq(1)
      delete "/films/#{film.id}/comments/#{comment.id}"
      expect(Comment.count).to eq(0)
    end

    it 'should not delete another\'s comment' do
      sign_in create(:tony_hawk)
      film
      user
      comment = Comment.create({ user_id: user.id, film_id: film.id, text: '12323' })
      expect(Comment.count).to eq(1)
      delete "/films/#{film.id}/comments/#{comment.id}"
      expect(Comment.count).to eq(1)
    end
  end
end
