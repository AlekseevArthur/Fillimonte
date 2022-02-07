require 'rails_helper'

RSpec.describe 'Comments request', type: :request do
  let!(:film)   { create :film }
  let(:user)    { create :user }
  let(:request) { :post }
  let(:path)    { "/films/#{film.id}/comments" }
  let(:params)  { { comment: '123' } }

  subject do
    send(request, path, params: params)
    response
  end

  context 'unauthorized user' do
    it 'should not add comment' do
      expect(subject).not_to have_http_status(:success)
    end
  end

  context 'authorized user' do
    context 'index' do
      it 'should add comment' do
        sign_in user
        expect { subject }.to change { Comment.count }.by(1)
      end
    end

    context 'delete' do
      let!(:comment) { create :comment, user: user, film: film }
      let(:request)  { :delete }
      let(:path)     { "/films/#{film.id}/comments/#{comment.id}" }
      let(:params)   {}

      it 'should delete own comment' do
        sign_in user
        expect { subject }.to change { Comment.count }.by(-1)
      end

      it 'should not delete another\'s comment' do
        sign_in create :tony_hawk
        expect { subject }.not_to(change { Comment.count })
      end
    end
  end
end
