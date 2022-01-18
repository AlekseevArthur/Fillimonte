require 'rails_helper'

RSpec.describe 'Films requests', type: :request do
  describe 'GET /index' do
    it do
      get '/films'
      expect(response).to have_http_status(:ok)
    end
  end
end
