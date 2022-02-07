require 'rails_helper'

RSpec.describe 'Watchlater requests', type: :request do
  let!(:film) { create(:film) }

  context 'from auth user' do
    let(:user) { create(:user) }

    before { sign_in user }

    it 'should add a film' do
      post "/user/watchlater?film_id=#{film.id}"
      expect(Watchlater.count).to eq(1)
      expect(user.watchlaters[0].film_id).to eq(film.id)
      expect(response).to have_http_status(:created)
    end

    it 'should delete the film' do
      Watchlater.create(user_id: user.id, film_id: film.id)
      expect(Watchlater.count).to eq(1)
      delete "/user/watchlater?film_id=#{film.id}"
      expect(Watchlater.count).to eq(0)
      expect(response).to have_http_status(204)
    end
  end

  it 'should redirect if the user unauth' do
    post "/user/watchlater?film_id=#{film.id}"
    expect(response).to have_http_status(302)
    delete "/user/watchlater?film_id=#{film.id}"
    expect(response).to have_http_status(302)
  end
end
