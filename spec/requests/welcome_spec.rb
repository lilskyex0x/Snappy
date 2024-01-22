require 'rails_helper'

RSpec.describe 'Welcomes', type: :request do
  describe 'GET /' do
    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end

    it 'displays the correct title' do
      get '/'
      expect(response.body).to include('Snappy')
    end

    it 'displays the correct description' do
      get '/'
      expect(response.body).to include('Finally, a budget app for you')
    end
  end
end
