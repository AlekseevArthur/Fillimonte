require 'rails_helper'

RSpec.describe 'Ratings requests', type: :request do
  let(:drive) { create(:drive) }
  let(:film) { create(:film) }
  let(:user) { create(:user) }

  it 'can add by auth user' do
    sign_in user
    film
    post "/films/#{film.id}/rating", params: { rating: 3 }
    expect(Rating.count).to eq(1)
    expect(response).to have_http_status(:created)
  end

  it 'can\'t add by guest' do
    film
    post "/films/#{film.id}/rating", params: { rating: 3 }
    expect(Rating.count).to eq(0)
    expect(response).to have_http_status(302)
  end

  it 'can change by auth user' do
    sign_in user
    film
    post "/films/#{film.id}/rating", params: { rating: 3 }
    expect(Rating.count).to eq(1)
    put "/films/#{film.id}/rating", params: { rating: 1 }
    expect(Rating.first.rating).to eq(1)
    expect(response).to have_http_status(200)
  end

  it 'can\'t add with wrong params' do
    sign_in user
    film
    post "/films/#{film.id}/rating", params: { rating: 10 }
    expect(Rating.count).to eq(0)
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
