require 'rails_helper'

RSpec.describe 'Films requests', type: :request do
  let(:film) { create(:film) }
  let(:drive) { create(:drive) }

  context 'GET /index' do
    it 'return all films' do
      film
      drive
      get '/films.json'
      expect(response).to have_http_status(:ok)
    end

    it 'filter matching films with query' do
      headers = { 'ACCEPT' => 'application/json' }
      film
      drive
      get "/films?query=#{drive.name}", params: {}, headers: headers
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end
end
