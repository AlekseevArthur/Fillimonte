require 'rails_helper'

RSpec.describe 'Viewed requests', type: :request do
  let!(:film) { create(:film) }

  context 'from auth user' do
    let(:user) { create(:user) }

    before { sign_in user }

    it 'should add film' do
      post "/user/viewed?film_id=#{film.id}"
      expect(Viewed.count).to eq(1)
      expect(user.vieweds.first.film_id).to eq(film.id)
      expect(response).to have_http_status(:created)
    end

    it 'should delete film' do
      Viewed.create(user_id: user.id, film_id: film.id)
      expect(Viewed.count).to eq(1)
      delete "/user/viewed?film_id=#{film.id}"
      expect(Viewed.count).to eq(0)
      expect(response).to have_http_status(204)
    end
  end

  it 'should redirect if user unauth' do
    post "/user/viewed?film_id=#{film.id}"
    expect(response).to have_http_status(302)
    delete "/user/viewed?film_id=#{film.id}"
    expect(response).to have_http_status(302)
  end
end
