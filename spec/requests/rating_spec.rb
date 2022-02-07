require 'rails_helper'

RSpec.describe 'Ratings requests', type: :request do
  let!(:film) { create :film }

  context 'from auth user' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    it 'can create' do
      post "/films/#{film.id}/rating", params: { rating: 3 }
      expect(Rating.count).to eq(1)
      expect(response).to have_http_status(:created)
    end

    it 'can update' do
      post "/films/#{film.id}/rating", params: { rating: 3 }
      expect(Rating.first.rating).to eq(3)
      put "/films/#{film.id}/rating", params: { rating: 1 }
      expect(Rating.first.rating).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  it 'can\'t add by guest' do
    film
    post "/films/#{film.id}/rating", params: { rating: 3 }
    expect(Rating.count).to eq(0)
    expect(response).to have_http_status(302)
  end
end
