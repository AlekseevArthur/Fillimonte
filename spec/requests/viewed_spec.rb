require 'rails_helper'

RSpec.describe 'Viewed requests', type: :request do
  let(:user) { create(:user) }
  let(:film) { create(:film) }

  it 'should add film' do
    sign_in user
    film
    post "/user/viewed?film_id=#{film.id}"
    expect(Viewed.count).to eq(1)
    expect(user.vieweds.first.film_id).to eq(film.id)
    expect(response).to have_http_status(:created)
  end

  it 'should delete film' do
    sign_in user
    film
    Viewed.create(user_id: user.id, film_id: film.id)
    expect(Viewed.count).to eq(1)
    delete "/user/viewed?film_id=#{film.id}"
    expect(Viewed.count).to eq(0)
    expect(response).to have_http_status(204)
  end

  it 'should redirect if user unauth' do
    film
    post "/user/viewed?film_id=#{film.id}"
    expect(response).to have_http_status(302)
    delete "/user/viewed?film_id=#{film.id}"
    expect(response).to have_http_status(302)
  end
end
